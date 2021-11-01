//
//  Extension.swift
//  Al-Fath Project
//
//  Created by Rio Sudarsono on 28/10/21.
//

import Foundation
import CoreHaptics


extension UserDefaults{

    func setFirstTime(value: Bool) {
        set(value, forKey: UserDefaultsKeys.isFirstTime.rawValue)
    }

    func isFirstTime()-> Bool {
        return bool(forKey: UserDefaultsKeys.isFirstTime.rawValue)
    }
    
    func setHaptic(value: Bool) {
        set(value, forKey: UserDefaultsKeys.isHaptic.rawValue)
    }

    func isHaptic()-> Bool {
        return bool(forKey: UserDefaultsKeys.isHaptic.rawValue)
    }
}

enum UserDefaultsKeys : String {
    case isFirstTime
    case isHaptic
}


