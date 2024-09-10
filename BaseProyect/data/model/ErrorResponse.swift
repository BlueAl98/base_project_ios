//
//  ErrorResponse.swift
//  BaseProyect
//
//  Created by Najib Loera on 22/08/24.
//

import Foundation

struct ErrorResponse: Decodable {
    let error: String?
    let errors: [String]?
}
