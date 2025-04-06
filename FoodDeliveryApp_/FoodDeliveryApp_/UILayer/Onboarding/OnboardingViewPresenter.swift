//
//  OnboardingViewPresenter.swift
//  FoodDeliveryApp_
//
//  Created by Rustam Shakirzianov on 06.04.2025.
//

import Foundation

protocol OnboardingViewOutput: AnyObject {
    func onboardingFinish()
}

class OnboardingViewPresenter: OnboardingViewOutput {
    
    //MARK: - Properties
    weak var coordinator: OnboardingCoordinator!
    
    init(coordinator: OnboardingCoordinator!) {
        self.coordinator = coordinator
    }
    
    func onboardingFinish() {
        coordinator.finish()
    }
    
    
}

