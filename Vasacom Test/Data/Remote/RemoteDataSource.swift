//
//  RemoteDataSource.swift
//  Vasacom Test
//
//  Created by MEKARI on 02/10/23.
//

protocol RemoteDataSource {
    func login(email: String, password: String, completion: @escaping (Result<LoginResponse, Error>) -> Void)
}
