//
//  UserStorage.swift
//  FoodDeliveryApp_
//
//  Created by Rustam Shakirzianov on 21.04.2025.
//

import Foundation

class UserStorage {
    
    static let shared = UserStorage()
    
    var passedOnboarding: Bool {
        get { UserDefaults.standard.bool(forKey: "passedOnboarding") }
        set { UserDefaults.standard.set(newValue, forKey: "passedOnboarding")}
    }
}
