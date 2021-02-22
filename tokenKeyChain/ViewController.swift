//
//  ViewController.swift
//  tokenKeyChain
//
//  Created by heo on 2021/02/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var resultDataLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 12줄까지 허용
        self.resultDataLabel.numberOfLines = 12
        self.resultDataLabel.text = "UUID : \(loadUUID())"
    }
    
    @IBAction func signInButton(_ sender: Any) {
        
        // textfield 입력값 추출
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        // 입력값 정리
        let signInParameter = SignInRequest(type: "M", email: email, password: password)
        
        // 모델 선언
        let signInModel = SignInModel(signIn: signInParameter)
        
        // 통신
        signInModel.fetchModel { (result: Result<SignInResponse, APIError>) in
            switch result {
            case .success(let model):
                
                // 데이터 송수신 성공 시 동작부
                print(model)
                
                // 토큰 정보 추출
                let accessToken = model.accessToken
                let refreshToken = model.refreshToken
                
                // 토큰 정보 저장
                let tk = TokenUtils()
                tk.save(Bundle.main.bundleIdentifier!, account: "accessToken", value: accessToken)
                tk.save(Bundle.main.bundleIdentifier!, account: "refreshToken", value: refreshToken)
                
                // UI는 메인스레드에서 비동기로 처리
//                DispatchQueue.main.async {
//                    self.resultDataLabel.text = "Access Token : \n\(model.accessToken)"
//                    self.resultDataLabel.sizeToFit()
//                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    @IBAction func signOutButton(_ sender: Any) {
        
        let signOutModel = SignOutModel()
        signOutModel.fetchModel { (result: Result<SignOutResponse, APIError>) in
            switch result {
            case .success(let model):
                // 데이터 송수신 성공 시 동작부
                print(model.error)
            case .failure(let error):
                print(error)
            }
        }
        
        
    }
}

