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
    
    func setNotifyPractice(value: Bool) {
        set(value, forKey: UserDefaultsKeys.isNotifyPractice.rawValue)
    }

    func isNotifyPractice()-> Bool {
        return bool(forKey: UserDefaultsKeys.isNotifyPractice.rawValue)
    }
    
    func setTutorLearn(value: Bool) {
        set(value, forKey: UserDefaultsKeys.isTutorLearn.rawValue)
    }
    
    func isTutorLearn()-> Bool {
        return bool(forKey: UserDefaultsKeys.isTutorLearn.rawValue)
    }
    
    func setTutorPoint(value: Bool) {
        set(value, forKey: UserDefaultsKeys.isTutorPoint.rawValue)
    }
    
    func isTutorPoint()-> Bool {
        return bool(forKey: UserDefaultsKeys.isTutorPoint.rawValue)
    }
}

enum UserDefaultsKeys : String {
    case isFirstTime
    case isHaptic
    case isNotifyPractice
    case isTutorLearn
    case isTutorPoint
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
    public static var greenLight = Color("ColorGreenLight")
    public static var blue = Color("ColorBlue")
    public static var greyLight = Color("ColorGreyLight")
    public static var gold = Color("ColorGold")
}

extension Array {
    public subscript (safe index: Int) -> Element? {
        return self.indices ~= index ? self[index] : nil
    }
}


