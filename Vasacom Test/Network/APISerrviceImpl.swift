//
//  APISerrviceImpl.swift
//  Vasacom Test
//
//  Created by MEKARI on 02/10/23.
//

import Foundation

class APIServicesImpl: APIServices {
    
    private let baseURL = "https://reqres.in/api/"
    
    func get(_ url: String, parameters: [String : String], completion: @escaping (Result<Data,Error>) -> Void) {
        var components = URLComponents(string: baseURL+url)!
        components.queryItems = parameters.map{
            return  URLQueryItem(name: $0, value: $1)
        }
        
        let request = URLRequest(url: components.url!)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let response = response as? HTTPURLResponse, let data = data else { return }
            if let error = error {
                completion(.failure(error))
                print("ERROR: \(error.localizedDescription)")
            }
            if response.statusCode == 200 {
                DispatchQueue.main.async {
                    completion(.success(data))
                }
            } else {
                print("ERROR: \(data), HTTP Status: \(response.statusCode)")
            }
        }
        task.resume()
    }
    
    func post(_ url: String, body: [String : String], completion: @escaping (Result<Data, Error>) -> Void) {
        let components = URLComponents(string: baseURL+url)!
        let bodyData = try? JSONSerialization.data(withJSONObject: body)
        
        var request = URLRequest(url: components.url!)
        request.httpMethod = "POST"
        request.httpBody = bodyData
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let response = response as? HTTPURLResponse, let data = data else { return }
            if let error = error {
                completion(.failure(error))
                print("ERROR: \(error.localizedDescription)")
            }
            if response.statusCode == 200 {
                DispatchQueue.main.async {
                    completion(.success(data))
                }
            } else {
                do {
                    let jsonData = try JSONDecoder().decode(LoginResponse.self, from: data)
                    let errorMessage = jsonData.error ?? "Internal server error"
                    let customError = NSError(domain: "", code: response.statusCode, userInfo: [ NSLocalizedDescriptionKey: errorMessage])
                    completion(.failure(customError))
                } catch {
                    completion(.failure(error))
                }
                print("ERROR: \(data), HTTP Status: \(response.statusCode)")
            }
        }
        task.resume()
    }
}
