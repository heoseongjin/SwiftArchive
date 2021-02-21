//
//  SignInModel.swift
//  urlsession_test
//
//  Created by heo on 2021/02/22.
//

import Foundation

class SignInModel {
    
    var apiManager = APIManager()
    let baseURL: String
    let relativeURL: String
    let signIn: SignIn

    init(relativeURL: String, signIn: SignIn) {
        self.apiManager = APIManager()
        self.baseURL = self.apiManager.baseURL
        self.relativeURL = relativeURL
        self.signIn = signIn
    }
    
    
    func fetchModel<T: Decodable>(completion: @escaping (Result<T, APIError>) -> Void) {
        let url = URL(string: relativeURL, relativeTo: URL(string: baseURL))!
        
        
        let jsonData = try? JSONEncoder().encode(self.signIn)
        
        // Request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        // setting
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue(String(jsonData!.count), forHTTPHeaderField: "content-Length")

        // insert header data to request
        request.setValue("12345", forHTTPHeaderField: "SSAID")
        
        // insert json data to request
        request.httpBody = jsonData

        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data else {
                return completion(.failure(.data))
            }
            
            guard let model = try? JSONDecoder().decode(T.self, from: data) else {
                return completion(.failure(.decodingJSON))
            }
            
            completion(.success(model))
        }.resume()
    }
    
}


struct SignIn: Codable {
    let type: String
    let email: String
    let password: String
}

struct Response: Codable {
    let accessToken: String
    let error: ErrorResponse
    let refreshToken: String
}

struct ErrorResponse: Codable {
    let code: Int
    let msg: String
}
