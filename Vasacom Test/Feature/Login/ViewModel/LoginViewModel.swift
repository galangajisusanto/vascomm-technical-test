//
//  LoginViewModel.swift
//  Vasacom Test
//
//  Created by MEKARI on 02/10/23.
//

import Foundation

class LoginViewModel {
    private let repository: LoginRepository
    init(repository: LoginRepository) {
        self.repository = repository
    }
    func login(email: String, password: String, completion: @escaping (Result<LoginResponse, Error>) -> Void) {
        self.repository.login(email: email, password: password){ result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                print("Error processinng json data: \(error)")
                completion(.failure(error))
            }
        }
    }
    
}
