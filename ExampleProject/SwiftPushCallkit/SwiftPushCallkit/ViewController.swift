//
//  ViewController.swift
//  SwiftPushCallkit
//
//  Created by Heo on 2021/12/03.
//

import UIKit
import PushKit
import CallKit

class ViewController: UIViewController{
    
    override func viewDidLoad() {
        let registry = PKPushRegistry(queue: nil)
        registry.delegate = self
        registry.desiredPushTypes = [PKPushType.voIP]
    }
}


extension ViewController: CXProviderDelegate {
    func providerDidReset(_ provider: CXProvider) {
    }
    
    func provider(_ provider: CXProvider, perform action: CXAnswerCallAction) {
        action.fulfill()
    }
    
    func provider(_ provider: CXProvider, perform action: CXEndCallAction) {
        action.fulfill()
    }
}

extension ViewController: PKPushRegistryDelegate {
    
    /// 토큰 획득
    func pushRegistry(_ registry: PKPushRegistry, didUpdate pushCredentials: PKPushCredentials, for type: PKPushType) {
        print(pushCredentials.token.map { String(format: "%02.2hhx", $0) }.joined())
    }
    
    /// Push알림이 왔을 때 호출되는 콜백
    func pushRegistry(_ registry: PKPushRegistry, didReceiveIncomingPushWith payload: PKPushPayload, for type: PKPushType, completion: @escaping () -> Void) {
        
        
        if !(Locale.current.regionCode == "CN" || Locale.current.regionCode == "KR" || Locale.current.regionCode == "CHN") {
            // only init for countries that aren't China
            let config = CXProviderConfiguration()
            config.includesCallsInRecents = false
            config.supportsVideo = true;
            
            let provider = CXProvider(configuration: config)
            provider.setDelegate(self, queue: nil)
            
            let update = CXCallUpdate()
            update.remoteHandle = CXHandle(type: .generic, value: "Heo")
            update.hasVideo = true
            
            provider.reportNewIncomingCall(with: UUID(), update: update, completion: { error in })
        }
    }
}

