//
//  UUID.swift
//  tokenKeyChain
//
//  Created by heo on 2021/02/22.
//

import Foundation

// keychain에 저장된 UUID 제공, 없을 경우 신규 생성 저장
func loadUUID() -> String {
    let tk = TokenUtils()
    
    if let uuid = tk.load(Bundle.main.bundleIdentifier!, account: "uuid") {
        return uuid
    } else {
        let inital_uuid = UUID().uuidString
        tk.save(Bundle.main.bundleIdentifier!, account: "uuid", value: inital_uuid)
        return inital_uuid
    }
}
