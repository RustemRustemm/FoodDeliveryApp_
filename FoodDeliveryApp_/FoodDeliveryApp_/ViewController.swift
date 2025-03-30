//
//  ViewController.swift
//  FoodDeliveryApp_
//
//  Created by Rustam Shakirzianov on 24.03.2025.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Создаем UILabel
                let label = UILabel()
                
        // Настраиваем свойства label
        label.text = "Hello World!"
//        label.textColor = .white
//        label.font = UIFont.systemFont(ofSize: 40, weight: .regular)
//        label.font = UIFont.systemFont(ofSize: 40, weight: UIFont.Weight(rawValue: 20))
//        label.font = .Roboto.thin.size(of: 40)
        label.font = .Roboto.bold.size(of: 40)
        
        label.textAlignment = .left
        label.numberOfLines = 0 // Многострочный текст
//                label.backgroundColor = .lightGray // Для наглядности
        
        // Отключаем автоматические constraints
        label.translatesAutoresizingMaskIntoConstraints = false
        
        // Добавляем label на view контроллера
        view.addSubview(label)
        
        // Устанавливаем constraints:
        // - отступ сверху 100 пунктов от safeArea
        // - отступ слева 20 пунктов
        // - отступ справа 20 пунктов
        // - высота автоматическая (по содержимому)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        label.textColor = AppColors.accentOrange
//        view.backgroundColor = .red
        view.backgroundColor = AppColors.background
    }


}

