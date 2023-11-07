//
//  RemoteDataSourceImpl.swift
//  Vasacom Test
//
//  Created by MEKARI on 02/10/23.
//

import Foundation

class RemoteDataSourceImpl: RemoteDataSource {
    
    let apiServices: APIServices
    
    init(apiServices: APIServices) {
        self.apiServices = apiServices
    }
    
    func login(email: String, password: String, completion: @escaping (Result<LoginResponse, Error>) -> Void) {
        self.apiServices.post("login", body: ["email" : email, "password": password]) { result in
            switch result {
            case .success(let data):
                do {
                    let jsonData = try JSONDecoder().decode(LoginResponse.self, from: data)
                    completion(.success(jsonData))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                print("Error processinng json data: \(error)")
                completion(.failure(error))
            }
        }
    }
}
