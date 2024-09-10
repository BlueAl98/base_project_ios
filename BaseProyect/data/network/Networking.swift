//
//  Networking.swift
//  BaseProyect
//
//  Created by Najib Loera on 22/08/24.
//

import Foundation

class Networking {
    static let shared = Networking()
    private init() {}


    func handleHTTPResponse(data: Data, response: URLResponse) throws -> Data {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkingError.unknownError
        }
        print("STATUS CODE: ", httpResponse.statusCode)

        guard (200...299).contains(httpResponse.statusCode) else {
          
            if let errorResponse = try? JSONDecoder().decode(ErrorResponse.self, from: data) {
                if let errorMessage = errorResponse.error {
                    print("SERVER ERROR:", errorMessage)
                    
                    if (httpResponse.statusCode == 401){
                    if (errorMessage.elementsEqual("Token has expired")){
                        throw NetworkingError.tokenExpired
                       }
                    }
                    throw NetworkingError.serverError(errorMessage)
                } else if let errorMessages = errorResponse.errors, !errorMessages.isEmpty {
                    print("SERVER ERROR:", errorMessages)
                    throw NetworkingError.serverError(errorMessages.first!)
                } else {
                    print("ERROR Unknown")
                    throw NetworkingError.unknownError
                }
            } else {
                print("ERROR Unknown")
                throw NetworkingError.unknownError
            }
        }
        return data
    }

    func performRequest<T: Decodable>(_ request: URLRequest) async throws -> T {
        do {
            // Realiza la solicitud original
            let (data, response) = try await URLSession.shared.data(for: request)
            let responseData = try handleHTTPResponse(data: data, response: response)
            let decodedData = try JSONDecoder().decode(T.self, from: responseData)
            return decodedData
            
        } catch NetworkingError.tokenExpired {
            // Si se detecta un error 401, intenta refrescar el token
            try await refreshAuthToken()

            // Después de refrescar el token, realiza la solicitud original nuevamente
            var newRequest = request
            if let newToken = TokenStorage().retrieveToken() {
                newRequest.setValue("Bearer \(newToken)", forHTTPHeaderField: "Authorization")
            }
            // Repite la solicitud con el nuevo token
            let (data, response) = try await URLSession.shared.data(for: newRequest)
            let responseData = try handleHTTPResponse(data: data, response: response)
            let decodedData = try JSONDecoder().decode(T.self, from: responseData)
            return decodedData
        }
    }
    
    
    func refreshAuthToken() async throws {
        guard let token = TokenStorage().retrieveToken() else {
            throw NetworkingError.unauthorized // No se encontró un token válido
        }

        guard let url = URL(string: Constants.BASE_URL + "refresh") else {
            throw NetworkingError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        let (data, response) = try await URLSession.shared.data(for: request)
        let responseData = try handleHTTPResponse(data: data, response: response)

        let tokenResponse = try JSONDecoder().decode(RefreshTokenResponse.self, from: responseData)
    
        // Guarda el nuevo token
        TokenStorage().saveToken(tokenResponse.token)
    
    }
 
}

enum NetworkingError: LocalizedError {
    case invalidURL
    case serverError(String)
    case decodingError
    case unknownError
    case unauthorized
    case noInternetConnection
    case timeout
    case tokenExpired

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "La URL es inválida."
        case .serverError(let message):
            return message
        case .decodingError:
            return "Error al decodificar la respuesta del servidor."
        case .unauthorized:
            return "No autorizado"
        case .unknownError:
            return "Ocurrió un error desconocido."
        case .noInternetConnection:
            return "No hay conexión a Internet."
        case .timeout:
            return "Tiempo de espera agotado."
        case .tokenExpired:
            return "El token ha expirado vuelva a iniciar sesión"
        }
    }
}
