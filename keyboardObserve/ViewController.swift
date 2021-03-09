//
//  ViewController.swift
//  keyboardObserve
//
//  Created by heo on 2021/03/09.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var bottomButton: UIButton!
    var bottomButtonConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bottomButtonConstraint = bottomButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24)
        bottomButtonConstraint.isActive = true
        
        // vs. setNeedsLayout
        self.view.layoutIfNeeded()
        // keyboard Observing
        subscribeToShowKeyboardNotifications()
    }
}

extension ViewController {
    // Keyboard On
    @objc func keyboardWillShow(_ notification: Notification) {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue
        let keyboardHeight = keyboardSize.cgRectValue.height
        //adjust button Constraint
        bottomButtonConstraint.constant = -8 - keyboardHeight
    }

    // Keyboard Off
    @objc func keyboardWillHide(_ notification: Notification) {
        //adjust button Constraint
        bottomButtonConstraint.constant = -24
    }

    // Keyboard Observing
    func subscribeToShowKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
}
