//
//  LoginRepositoryImpl.swift
//  Vasacom Test
//
//  Created by MEKARI on 02/10/23.
//

class LoginRepositoryImpl: LoginRepository {
    let remoteDataSource: RemoteDataSource
    
    init(remoteDataSource: RemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    func login(email: String, password: String, completion: @escaping (Result<LoginResponse, Error>) -> Void) {
        remoteDataSource.login(email: email, password: password) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
