//
//  Extension.swift
//  Al-Fath Project
//
//  Created by Rio Sudarsono on 28/10/21.
//

import Foundation

extension UserDefaults{

    func setFirstTime(value: Bool) {
        set(value, forKey: UserDefaultsKeys.isFirstTime.rawValue)
    }

    func isFirstTime()-> Bool {
        return bool(forKey: UserDefaultsKeys.isFirstTime.rawValue)
    }
}

enum UserDefaultsKeys : String {
    case isFirstTime
}
