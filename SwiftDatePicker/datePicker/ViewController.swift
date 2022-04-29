//
//  ViewController.swift
//  datePicker
//
//  Created by heo on 2021/02/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var dateTextField: UITextField!
    
    var datePicker: UIDatePicker!
    var maximumDate: Date = Date() //today
    var minimumDate: Date = Date(timeIntervalSinceNow: -3786912000) // 120 years ago
    var defaultDate: Date = Date(timeIntervalSinceNow: -631152000) // 20 years ago
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupdatePicker(maximumDate: maximumDate, minimumDate: minimumDate, defaultDate: defaultDate)
    }
    
    func setupdatePicker(maximumDate: Date, minimumDate: Date, defaultDate: Date) {
        
        //create datePicker
        self.datePicker = UIDatePicker.init(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 200))
        
        // datePicker 한국어 변경
        let locale: Locale = NSLocale(localeIdentifier: "ko_KO") as Locale
        datePicker.locale = locale
        
        // datePicker 최소/최대/기본 날짜 설정
        datePicker.maximumDate = maximumDate
        datePicker.minimumDate = minimumDate
        datePicker.date = defaultDate
        
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(self.dateChanged), for: .allEvents)

        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        }

        self.dateTextField.inputView = datePicker

        //create ToolBar
        let toolBar:UIToolbar = UIToolbar.init(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 44))

        //for space
        let spaceButton:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)

        //for Done
//        let doneButton:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.tapOnDoneBut))
        let doneButton:UIBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(self.tapOnDoneBut))

        toolBar.setItems([spaceButton, doneButton], animated: true)

        self.dateTextField.inputAccessoryView = toolBar
    }
    
    // 피커 변경 시 마다 입력
    @objc func dateChanged() {
        let dateFormat = DateFormatter()
        dateFormat.locale = Locale(identifier: "ko") // 로케일 변경함
        dateFormat.dateFormat = "yyyy년 MM월 dd일"
        self.dateTextField.text = dateFormat.string(from: datePicker.date)
    }
    
    // done 버튼 터치 시 datePicker 제거
    @objc func tapOnDoneBut() {
        dateTextField.resignFirstResponder()
    }
    
    
}

