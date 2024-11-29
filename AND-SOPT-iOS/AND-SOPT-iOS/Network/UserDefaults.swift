//
//  UserDefaults.swift
//  AND-SOPT-iOS
//
//  Created by 김민서 on 11/7/24.
//

import Foundation

class UserDefaultsHelper {
    static var token: String? {
        get {
            return UserDefaults.standard.string(forKey: "userToken")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "userToken")
        }
    }
}
