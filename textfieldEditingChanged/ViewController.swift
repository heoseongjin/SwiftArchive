//
//  ViewController.swift
//  textfieldEditingChanged
//
//  Created by heo on 2021/02/19.
//

import UIKit
import LineTextField

class ViewController: UIViewController {

    @IBOutlet var emailTextfield: LineTextField!
    @IBOutlet var passwordTextfield: LineTextField!
    @IBOutlet var loginSuccessLabel: UILabel!
    @IBOutlet var button: UIButton!
    
    var emailInput: String?
    var passwordInput: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.isEnabled = false
        button.backgroundColor = .lightGray
        button.setTitleColor(.black, for: .normal)
        
        loginSuccessLabel.text = ""
    }

    @IBAction func emailTextfieldEditingChanged(_ sender: LineTextField) {
        emailInput = sender.text!
        loginValidate()
    }
    @IBAction func passwordTextfieldEditingChanged(_ sender: LineTextField) {
        passwordInput = sender.text!
        loginValidate()
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        loginSuccessLabel.text = "Login Success"
        print("로그인 성공")
    }
    
    func loginValidate() {
        
        let validEmail = isValidEmail(testStr: emailInput ?? "")
        let validPassword = isValidPassword(testStr: passwordInput ?? "")
        let validEmptyPassword = isValidEmpty(testStr: passwordInput ?? "")
        
        print("email : \(emailInput)\npassword : \(passwordInput)")
        print("isValidEmail : \(validEmail)")
        print("isValidPassword : \(validPassword)")
        print("isPasswordEmpty : \(validEmptyPassword)")
        print()
        
        // if validEmail && validEmptyPassword {
        if validEmail && validPassword {
            button.isEnabled = true
            button.backgroundColor = .blue
            button.setTitleColor(.white, for: .normal)
        } else {
            button.isEnabled = false
            button.backgroundColor = .lightGray
            button.setTitleColor(.black, for: .normal)
        }
    }
    
    
    func isValidEmail(testStr: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    

    func isValidPassword(testStr: String) -> Bool {
        // 영문, 숫자, 특수문자(~ ! @ # $ % ^ & * - _ ,)를 혼합하여 8자 이상
        let passwordRegEx = "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[~!@#$%^&*,_-])[A-Za-z0-9~!@#$%^&*,_-].{8,16}"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return passwordTest.evaluate(with: testStr)
    }
    
    func isValidEmpty(testStr: String) -> Bool {
        return testStr != "" ? true : false
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){

          self.view.endEditing(true)

    }
}

