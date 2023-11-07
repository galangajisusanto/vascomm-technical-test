//
//  Injection.swift
//  Vasacom Test
//
//  Created by MEKARI on 02/10/23.
//

import Foundation

final class Injection: NSObject {
    
    private func provideAPIServices() -> APIServices {
        return APIServicesImpl()
    }
    
    private func provideRemoteDataSource() -> RemoteDataSource {
        return RemoteDataSourceImpl(apiServices: provideAPIServices())
    }
    
    private func provideLoginRepository() -> LoginRepository {
        return  LoginRepositoryImpl(remoteDataSource: provideRemoteDataSource())
    }
    
    func provideLoginViewModel() -> LoginViewModel {
        return  LoginViewModel(repository: provideLoginRepository())
    }
    
}
