//
//  APIManager.swift
//  tokenKeyChain
//
//  Created by heo on 2021/02/22.
//

import Foundation

public enum Result<Success, Failure> where Failure : Error {
    /// A success, storing a `Success` value.
    case success(Success)

    /// A failure, storing a `Failure` value.
    case failure(Failure)
}

enum APIError: Error {
    case data
    case decodingJSON
}

enum URLType: String {
    case test = "****"
    case prod = "****"
}

enum RelativeURLType: String{
    case signIn = "/api_v1/auth/sign-in"
    case signOut = "/api_v1/auth/sign-out"
}

class APIManager {
    let baseURL = URLType.test.rawValue
}


struct ErrorResponse: Codable {
    let code: Int
    let msg: String
}
