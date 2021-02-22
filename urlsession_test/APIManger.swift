//
//  APIManger.swift
//  urlsession_test
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

class APIManager {
    let baseURL = URLType.test.rawValue
}
