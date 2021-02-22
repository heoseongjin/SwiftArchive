//
//  ViewController_extension.swift
//  tokenKeyChain
//
//  Created by heo on 2021/02/22.
//

import UIKit

extension UIViewController {
    
    // HEO : 화면 터치 시 키보드 내려감
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
          self.view.endEditing(true)
    }
}
