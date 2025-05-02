//
//  LoginCoordinator.swift
//  FoodDeliveryApp_
//
//  Created by Rustam Shakirzianov on 28.04.2025.
//

import Foundation

//MARK: - LogingCoordinator
class LoginCoordinator: Coordinator {
    
    //MARK: - Propoerties
    private let factory = SceneFactory.self
    
    //MARK: - Methods
    override func start() {
//        let vc = ViewController()
//        navigationController?.pushViewController(vc, animated: true)
        showAuthScene()
        
    }
    
    override func finish() {
        print("LoginCoordinator finish")
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}

//MARK: - Navigation
extension LoginCoordinator {
    
    func showAuthScene() {
        guard let navigationController = navigationController else { return }
        let vc = factory.makeAuthScene(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showSignInScene() {
        guard let navigationController = navigationController else { return }
        let vc = factory.makeSignInScene(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
    func showSignUpScene() {
        guard let navigationController = navigationController else { return }
        let vc = factory.makeSignUpScene(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }

}
