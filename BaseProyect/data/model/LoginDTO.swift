//
//  Login.swift
//  BaseProyect
//
//  Created by Najib Loera on 22/08/24.
//

import Foundation

struct LoginDTO: Decodable {
    let token: String
    
    func toDomain() -> Login {
        return Login(token: token)
    }
}
