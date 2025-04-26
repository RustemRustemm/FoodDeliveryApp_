//
//  LoginPresenter.swift
//  FoodDeliveryApp_
//
//  Created by Rustam Shakirzianov on 24.04.2025.
//

import Foundation

protocol LoginViewOutput: AnyObject {
    func loginStart()
    func registrationStart()
    func goToFacebookLogin()
    func goToGoogleLogin()
    func goToSignIn()
    func goToSignUp()
    func goToForgotPass()
    func back()
}


class LoginPresenter {
    
    private var coordinator: AppCoordinator? //private var coordinator: AppCoordinator!
    weak var viewInput: LoginViewInput?
    
    init(coordinator: AppCoordinator? = nil, viewInput: LoginViewInput? = nil) { //AppCoordinator!
        self.coordinator = coordinator
        self.viewInput = viewInput
    }
    
}

extension LoginPresenter: LoginViewOutput {
    func loginStart() {
        
    }
    
    func registrationStart() {
        
    }
    
    func goToFacebookLogin() {
        
    }
    
    func goToGoogleLogin() {
        
    }
    
    func goToSignIn() {
        coordinator?.showSignInScene()
    }
    
    func goToSignUp() {
        coordinator?.showSignUpScene()
    }
    
    func goToForgotPass() {
        
    }
    
    func back() {
        
    }
    
    
}
