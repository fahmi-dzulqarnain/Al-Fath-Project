//
//  UserViewModel.swift
//  Al-Fath Project
//
//  Created by Rio Sudarsono on 01/11/21.
//

import Foundation

class UserViewModel: ObservableObject {
    init() {
            isHaptic = UserDefaults.standard.isHaptic()
        }

    @Published var isHaptic: Bool {
        didSet {
            UserDefaults.standard.setHaptic(value: isHaptic)
        }
    }
}
