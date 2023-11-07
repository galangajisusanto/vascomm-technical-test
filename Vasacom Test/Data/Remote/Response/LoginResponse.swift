//
//  LoginResponse.swift
//  Vasacom Test
//
//  Created by MEKARI on 02/10/23.
//

struct LoginResponse: Codable {
    let token: String?
    let error: String?
    
    enum CodingKeys: String, CodingKey {
        case token, error
    }
}
