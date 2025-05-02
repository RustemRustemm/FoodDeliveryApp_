//
//  OrderCoordinator.swift
//  FoodDeliveryApp_
//
//  Created by Rustam Shakirzianov on 06.04.2025.
//

import UIKit

class OrderCoordinator: Coordinator {
    
    override func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .yellow
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("AppCoordinator finish")
    }
}
