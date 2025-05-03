//
//  FDCollectionTitle.swift
//  FoodDeliveryApp_
//
//  Created by Rustam Shakirzianov on 03.05.2025.
//

import UIKit

class FDCollectionTitle: UIView {
    
    let title = UILabel()
    let viewAll = UIButton()
    
    init() {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

private extension FDCollectionTitle {
    
    func setupLayout() {
        configureView()
        configureTitle()
        configureViewAll()
        
        
    }
    
    func configureView() {
        self.backgroundColor = .clear
    }
    
    func configureTitle() {
        addSubview(title)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.boldSystemFont(ofSize: 18)//.Roboto.bold.size(of: 18)
        title.text = "Title"
        title.textColor = AppColors.black
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: self.topAnchor),
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            title.heightAnchor.constraint(equalToConstant: 22)
            
        ])
    }
    
    func configureViewAll() {
        addSubview(viewAll)
        
        viewAll.translatesAutoresizingMaskIntoConstraints = false
//        viewAll.titleLabel?.textColor = AppColors.grey
        viewAll.titleLabel?.font = UIFont.systemFont(ofSize: 12)//.Roboto.regular.size(of: 12)
        viewAll.setTitle("View All", for: .normal)
        viewAll.setTitleColor(AppColors.black, for: .normal)
//        viewAll.font = .Roboto.regular.size(o/f: 12)
        
        
        NSLayoutConstraint.activate([
            viewAll.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
            viewAll.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            viewAll.heightAnchor.constraint(equalToConstant: 22)
            
        ])
    }
}
