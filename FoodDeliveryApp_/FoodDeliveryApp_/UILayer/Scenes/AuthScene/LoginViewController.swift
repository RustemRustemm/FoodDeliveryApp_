//
//  LoginViewController.swift
//  FoodDeliveryApp_
//
//  Created by Rustam Shakirzianov on 22.04.2025.
//

import UIKit

class LoginViewController: UIViewController {

    private let bottomView = BottomView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        view.backgroundColor = .cyan
        setupLayout()
        
//        bottomView.button2Action = facebookPressed
//        bottomView.button1Action = googlePlusPressed
    }
    
    func facebookPressed() {
        print("facebookPressed")
    }
    
    func googlePlusPressed() {
        print("googlePlusPressed")
    }
}


private extension LoginViewController {
    func setupLayout() {
        setupBottomView()
    }
    
    func setupBottomView() {
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        
        bottomView.button2Action = facebookPressed
        bottomView.button1Action = googlePlusPressed
        
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
}

#Preview("LoginVC") {
    LoginViewController()
}
