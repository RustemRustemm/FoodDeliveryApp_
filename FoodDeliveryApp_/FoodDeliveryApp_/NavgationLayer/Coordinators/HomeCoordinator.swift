//
//  HomeCoordinator.swift
//  FoodDeliveryApp_
//
//  Created by Rustam Shakirzianov on 06.04.2025.
//

import UIKit

class HomeCoordinator: Coordinator {
    
    override func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .red
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}
