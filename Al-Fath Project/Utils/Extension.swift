//
//  Extension.swift
//  Al-Fath Project
//
//  Created by Rio Sudarsono on 28/10/21.
//

import Foundation
import CoreHaptics
import SwiftUI

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

extension View {
    @ViewBuilder func isHidden(_ isHidden: Bool) -> some View {
        if isHidden {
            self.hidden()
        } else {
            self
        }
    }
}

extension Color {
    public static var primary = Color("ColorPrimary")
    public static var secondary = Color("ColorSecondary")
    public static var third = Color("ColorThird")
    public static var text = Color("ColorText")
    public static var colorGreen = Color("ColorGreen")
    public static var blue = Color("ColorBlue")
}

extension Array {
    public subscript (safe index: Int) -> Element? {
        return self.indices ~= index ? self[index] : nil
    }
}


