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
}

enum UserDefaultsKeys : String {
    case isFirstTime
    case isHaptic
    case isNotifyPractice
}

extension View {
    @ViewBuilder func isHidden(_ isHidden: Bool) -> some View {
        if isHidden {
            self.hidden()
        } else {
            self
        }
    }
    
    func simpleSuccess() {
        if !UserDefaults.standard.isHaptic() {
            return
        }
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    
    func complexSuccess(engine : CHHapticEngine?) {
        if !UserDefaults.standard.isHaptic() {
            return
        }
        
        // make sure that the device supports haptics
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        var events = [CHHapticEvent]()

        // create one intense, sharp tap
        for i in stride(from: 0, to: 2, by: 0.1) {
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(i))
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(i))
            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: i)
            events.append(event)
        }

        for i in stride(from: 0, to: 1, by: 0.1) {
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1 - i))
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1 - i))
            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 1 + i)
            events.append(event)
        }

        // convert those events into a pattern and play it immediately
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play pattern: \(error.localizedDescription).")
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


