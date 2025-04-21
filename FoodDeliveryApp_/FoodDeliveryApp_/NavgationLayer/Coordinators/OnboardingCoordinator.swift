//
//  OnboardingCoordinator.swift
//  FoodDeliveryApp_
//
//  Created by Rustam Shakirzianov on 06.04.2025.
//

import UIKit


//MARK: - OnboardingCoordinator
class OnboardingCoordinator: Coordinator {
    
    //MARK: - Propoerties
    private let factory = SceneFactory.self
    
    //MARK: - Methods
    override func start() {
//        let vc = ViewController()
//        navigationController?.pushViewController(vc, animated: true)
        
        showOnboarding()
    }
    
    override func finish() {
        print("AppCoordinator finish")
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}

//MARK: - Navigation
private extension OnboardingCoordinator {
    
    func showOnboarding() {
        
        let viewController = factory.makeOnboardingScene(coordinator: self)
        navigationController?.pushViewController(viewController, animated: true)
    }
}



