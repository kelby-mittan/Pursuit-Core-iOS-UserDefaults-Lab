//
//  UserNameSign.swift
//  UserDefaultsHoroscope
//
//  Created by Kelby Mittan on 1/14/20.
//  Copyright © 2020 Kelby Mittan. All rights reserved.
//

import Foundation


struct UserPreferenceKey {
    static let userName = "User Name"
    static let userSign = "User Sign"
}

class UserNameSign {
    
    private init() {}
    
    static let shared = UserNameSign()
    
    func updateUserName(with unit: String) {
        UserDefaults.standard.set(unit, forKey: UserPreferenceKey.userName)
    }
    
    func updateSign(with sign: String) {
        UserDefaults.standard.set(sign, forKey: UserPreferenceKey.userSign)
    }
    
    func getUserName() -> String? {
        guard let userName = UserDefaults.standard.object(forKey: UserPreferenceKey.userName) as? String else {
            return nil
        }
        return userName
    }
    
    func getUserSign() -> String? {
        guard let userSign = UserDefaults.standard.object(forKey: UserPreferenceKey.userSign) as? String else {
            return nil
        }
        return userSign
    }
}
