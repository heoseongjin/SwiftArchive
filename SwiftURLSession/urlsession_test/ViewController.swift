//
//  ViewController.swift
//  urlsession_test
//
//  Created by heo on 2021/02/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var resultDataLabel: UILabel!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.resultDataLabel.numberOfLines = 20
    }

    @IBAction func networkRun(_ sender: Any) {
        
        // textfield 입력값 추출
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        // 입력값 struct로 정리
        let signIn = SignIn(type: "M", email: email, password: password)
        
        let signInModel = SignInModel(relativeURL: "/api_v1/auth/sign-in", signIn: signIn)
        signInModel.fetchModel { (result: Result<Response, APIError>) in
            switch result {
            case .success(let model):
                
                // 데이터 송수신 성공 시 동작부분
                print(model)
                
                // UI는 메인스레드에서 비동기로 처리
                DispatchQueue.main.async {
                    self.resultDataLabel.text = "Access Token : \n\(model.accessToken)"
                    self.resultDataLabel.sizeToFit()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    // HEO : 화면 터치 시 키보드 내려감
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){

          self.view.endEditing(true)

    }
}
