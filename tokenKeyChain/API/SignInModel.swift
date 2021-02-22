//
//  SignInModel.swift
//  tokenKeyChain
//
//  Created by heo on 2021/02/22.
//

import Foundation


class SignInModel {
    
    var apiManager = APIManager()
    let baseURL: String
    let relativeURL: String
    let signIn: SignInRequest

    init(signIn: SignInRequest) {
        self.apiManager = APIManager()
        self.baseURL = self.apiManager.baseURL
        self.relativeURL = RelativeURLType.signIn.rawValue
        self.signIn = signIn
    }
    
    
    func fetchModel<T: Decodable>(completion: @escaping (Result<T, APIError>) -> Void) {
        
        // 1. 전송할 데이터 준비
        let paramJsonData = try? JSONEncoder().encode(self.signIn)
        
        // 2. URL 객체 정의
        let url = URL(string: relativeURL, relativeTo: URL(string: baseURL))!
        
        // 3. URLRequest 객체 정의, 요청 내용 추가
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = paramJsonData
        
        // 4. HTTP 메세지 헤더 설정
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue(String(paramJsonData!.count), forHTTPHeaderField: "content-Length")
        
        // 4-1. SSAID 헤더 추가(UDID로 변경 필요)
        let uuid = loadUUID()
        request.setValue(uuid, forHTTPHeaderField: "SSAID")
    
        // 5. URLSession 객체를 통해 전송 및 응답값 처리 로직 작성
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            // 5-1. 서버가 응답이 없거나 통신이 실패했을 때
            if let e = error {
                NSLog("An error has occured : \(e.localizedDescription)")
                return
            }
            
            // 5-2. 응답 데이터 확인
            guard let data = data else {
                return completion(.failure(.data))
            }
            
            // 5-3. JSON Struct로 디코딩
            guard let model = try? JSONDecoder().decode(T.self, from: data) else {
                return completion(.failure(.decodingJSON))
            }
            
            // 5-4. 응답 처리 로직
            completion(.success(model))
            
        }.resume() // 6. POST 전송
    }
    
}


// Request
struct SignInRequest: Codable {
    let type: String
    let email: String
    let password: String
}


// Response
struct SignInResponse: Codable {
    let accessToken: String
    let error: ErrorResponse
    let refreshToken: String
}
