//
//  LoginPresenter.swift
//  FoodDeliveryApp_
//
//  Created by Rustam Shakirzianov on 24.04.2025.
//

import Foundation

protocol LoginViewOutput: AnyObject {
    func loginStart(login: String, password: String)
    func registrationStart()
    func goToFacebookLogin()
    func goToGoogleLogin()
    func goToSignIn()
    func goToSignUp()
    func goToForgotPass()
    func back()
}


class LoginPresenter {
    
    private var coordinator: LoginCoordinator? //private var coordinator: AppCoordinator!
    weak var viewInput: LoginViewInput?
    
    init(coordinator: LoginCoordinator? = nil, viewInput: LoginViewInput? = nil) { //AppCoordinator!
        self.coordinator = coordinator
        self.viewInput = viewInput
    }
    
} //DispatchQueue.main / DispatchQueue.global()

private extension LoginPresenter {
    func goToMainScreen() {
        coordinator?.finish()//showMainScene()
    }
}


extension LoginPresenter: LoginViewOutput {
    func loginStart(login: String, password: String) {
        
        viewInput?.startLoader()
        if login.lowercased() == "test@mail.com" && password == "123pas" {
            DispatchQueue.global().asyncAfter(deadline: .now() + 2.0) {
                DispatchQueue.main.async {
                    self.viewInput?.stopLoader()
                    self.goToMainScreen()
                }
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                print("wrong email or password")
                self.viewInput?.stopLoader()
            }
            
        }
        
    }
    
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
