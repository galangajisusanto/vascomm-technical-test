//
//  ApiService.swift
//  Vasacom Test
//
//  Created by MEKARI on 02/10/23.
//

import Foundation

protocol APIServices {
    func get(_ url: String, parameters: [String: String], completion: @escaping (Result<Data, Error>) -> Void)
    func post(_ url: String, body: [String: String], completion: @escaping (Result<Data, Error>) -> Void)

}
