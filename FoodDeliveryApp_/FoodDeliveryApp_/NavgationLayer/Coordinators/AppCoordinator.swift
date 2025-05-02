//
//  AppCoordinator.swift
//  FoodDeliveryApp_
//
//  Created by Rustam Shakirzianov on 06.04.2025.
//

import UIKit

class AppCoordinator: Coordinator {
        
    private let userStorage = UserStorage.shared
    private let factory = SceneFactory.self
    
    override func start() {
//        showOnboardingFlow()
//        UserDefaults.standard.removeObject(forKey: "passedOnboarding")
//        userStorage.passedOnboarding = false // при новом запуске программы показывает ознакомительное превью
//        if userStorage.passedOnboarding {
//            showAuthFlow()
//        } else {
//            showOnboardingFlow()
//        }
        showMainFlow()
        
        
//        let loginPresenter = LoginPresenter(coordinator: self)
//        let loginVC = LoginViewController(viewOutput: loginPresenter, state: .signIn)
//        navigationController?.pushViewController(loginVC, animated: true)
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}


// MARK: - Navigation methods
private extension AppCoordinator {
    func showOnboardingFlow() {
        guard let navigationController = navigationController else { return }
        let onboardingCoordinator = factory.makeOnboardingFlow(coordinator: self, finishDelegate: self, navigationController: navigationController)
        onboardingCoordinator.start()
    }
    
    func showMainFlow() {
        guard let navigationController = navigationController else { return }
        let tabBarController = factory.makeMainFlow(coordinator: self, finishDelegate: self)
        navigationController.pushViewController(tabBarController, animated: true)
    }
    
    func showAuthFlow() {
        guard let navigationController = navigationController else { return }
        let loginCoordinator = factory.makeLoginFlow(coordinator: self, finishDelegate: self, navigationController: navigationController)
        loginCoordinator.start()
    }
}


//MARK: - FinishDelegate
extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: any CoordinatorProtocol) {
        removeChildCoordinator(childCoordinator)
        switch childCoordinator.type {
        case .onboarding:
//            navigationController?.viewControllers.removeAll()
            showAuthFlow()
            navigationController?.viewControllers = [navigationController?.viewControllers.last ?? UIViewController()]
        case .login:
//            navigationController?.viewControllers.removeAll()
            showMainFlow()
            navigationController?.viewControllers = [navigationController?.viewControllers.last ?? UIViewController()]
        case .app:
            return
        default:
            navigationController?.popToRootViewController(animated: false)
        }
    }
}

