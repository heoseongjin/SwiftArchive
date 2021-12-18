//
//  ViewController.swift
//  SwiftPermission
//
//  Created by Heo on 2021/11/30.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /// 카메라 권한 체크
    @IBAction func tapCheckCamPermission(_ sender: Any) {
        
        /// status : 현재 Cam에 대한 권한 상태
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        
        switch status {
        /// 권한 있음
        case .authorized:
            print("CamPermission: authorized")
            
        /// 거부됨
        case .denied:
            print("CamPermission: denied")
            setAuthAlertAction()
            
        /// 결정되지 않음
        case .notDetermined:
            print("CamPermission: notDetermined")
            requestCamPermission()
        
        /// 제한됨(해당 부품 미존재 등)
        case .restricted:
            print("CamPermission: restricted")
            
        @unknown default:
            print("CamPermission: Unknown case")
        }
    }
    
    /// 마이크 권한 체크
    @IBAction func tapCheckMicPermission(_ sender: Any) {
        
        /// status : 현재 Mic에 대한 권한 상태
        let status = AVAudioSession.sharedInstance().recordPermission
        switch status {
        /// 권한 있음
        case .granted:
            print("MicPermission: granted")
            
        /// 거부됨
        case .denied:
            print("MicPermission: denied")
            setAuthAlertAction()
        
        /// 결정되지 않음
        case .undetermined:
            print("MicPermission: undetermined")
            requestMicPermission()
            
        @unknown default:
            print("MicPermission: Unknown case")
        }
    }
    
    /// Cam 권한 요청
    func requestCamPermission() {
        AVCaptureDevice.requestAccess(for: .video) { (granted: Bool) in
            if granted {
                print("Camera: 권한 허용")
            } else {
                print("Camera: 권한 거부")
            }
        }
    }
    
    /// Mic 권한 요청
    func requestMicPermission() {
        AVAudioSession.sharedInstance().requestRecordPermission { (granted: Bool) in
            if granted {
                print("Mic: 권한 허용")
            } else {
                print("Mic: 권한 거부")
            }
        }
    }
    
    /// 권한 설정 Alert
    /// 버튼 클릭 시 앱 설정으로 이동
    func setAuthAlertAction() {
        let authAlertController: UIAlertController
        authAlertController = UIAlertController(title: "권한 요청", message: "권한을 허용해야만 앱의 기능을 사용할 수 있습니다.", preferredStyle: UIAlertController.Style.alert)
        
        let getAuthAction: UIAlertAction
        getAuthAction = UIAlertAction(title: "설정으로 이동", style: UIAlertAction.Style.default) { _ in
            if let appSettings = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(appSettings, options: [:], completionHandler: nil)
            }
        }
        
        authAlertController.addAction(getAuthAction)
        self.present(authAlertController, animated: true, completion: nil)
    }
}

