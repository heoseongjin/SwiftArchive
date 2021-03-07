//
//  ViewController.swift
//  radioButton
//
//  Created by heo on 2021/03/03.
//

import UIKit
import DLRadioButton

class ViewController: UIViewController {

    @IBOutlet var radioButton1: DLRadioButton!
    @IBOutlet var radioButton2: DLRadioButton!
    @IBOutlet var radioButton3: DLRadioButton!
    @IBOutlet var radioButton4: DLRadioButton!
    @IBOutlet var radioButton5: DLRadioButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        radioButton1.setTitleColor(UIColor.blue, for: .selected)
        radioButton2.setTitleColor(UIColor.blue, for: .selected)
        radioButton3.setTitleColor(UIColor.blue, for: .selected)
        radioButton4.setTitleColor(UIColor.blue, for: .selected)
        radioButton5.setTitleColor(UIColor.blue, for: .selected)
        
        radioButton1.addTarget(self, action: #selector(btnTouch(_:)), for: .touchUpInside)
        radioButton2.addTarget(self, action: #selector(btnTouch(_:)), for: .touchUpInside)
        radioButton3.addTarget(self, action: #selector(btnTouch(_:)), for: .touchUpInside)
        radioButton4.addTarget(self, action: #selector(btnTouch(_:)), for: .touchUpInside)
        radioButton5.addTarget(self, action: #selector(btnTouch(_:)), for: .touchUpInside)
    }
    
    @objc func btnTouch(_ sender: DLRadioButton) {
        print(sender.currentTitle!)
    }
}

