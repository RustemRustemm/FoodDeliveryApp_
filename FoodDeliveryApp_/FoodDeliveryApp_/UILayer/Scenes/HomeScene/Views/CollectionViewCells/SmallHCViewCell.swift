//
//  SmallHCViewCell.swift
//  FoodDeliveryApp_
//
//  Created by Rustam Shakirzianov on 02.05.2025.
//

import UIKit

class SmallHCViewCell: UICollectionViewCell {
    
    let topView = UIView()
    let bottomLabel = UILabel()
    let imageView = UIImageView()
    var isCategorySelected = false
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with category: FoodCategory) {
        
        bottomLabel.text = category.rawValue
        
        switch category {
        case .drink:
            print(category, isCategorySelected)
            imageView.image = UIImage(resource: .drink).withTintColor(isCategorySelected ? .white : .black)
        case .snack:
            print(category, isCategorySelected)
            imageView.image = UIImage(resource: .snack).withTintColor(isCategorySelected ? .white : .black)
        case .food:
            print(category, isCategorySelected)
            imageView.image = UIImage(resource: .food).withTintColor(isCategorySelected ? .white : .black)
        case .cake:
            print(category, isCategorySelected)
            imageView.image = UIImage(resource: .cake).withTintColor(isCategorySelected ? .white : .black)
        case .salad:
            print(category, isCategorySelected)
            imageView.image = UIImage(resource: .salad).withTintColor(isCategorySelected ? .white : .black)
        case .seafood:
            print(category, isCategorySelected)
            imageView.image = UIImage(resource: .seafood).withTintColor(isCategorySelected ? .white : .black)
        case .none:
            print(category, isCategorySelected)
            imageView.image = UIImage(resource: .nopictures).withTintColor(isCategorySelected ? .white : .black)
        }
    }
    
    func toggleSelection() {
        
        isCategorySelected.toggle()
        if isCategorySelected {
            imageView.image = imageView.image?.withTintColor(.white)
            topView.backgroundColor = AppColors.accentOrange
            print(isCategorySelected)
            
        } else {
            imageView.image = imageView.image?.withTintColor(.black)
            topView.backgroundColor = AppColors.grey
            print(isCategorySelected)
        }
        
    }
    
    func setupCell() {
        contentView.backgroundColor = .clear //.blue
        setupTopView()
        setupBottomLabel()
    }
    
    func setupTopView() {
        contentView.addSubview(topView)
        
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = AppColors.grey
        topView.layer.cornerRadius = 20
        topView.layer.masksToBounds = true
        
        NSLayoutConstraint.activate([
            topView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            topView.topAnchor.constraint(equalTo: contentView.topAnchor),
            topView.widthAnchor.constraint(equalToConstant: 70),
            topView.heightAnchor.constraint(equalToConstant: 70),
            
        ])
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
//        imageView.image = UIImage(named: "testImage")
        topView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 30),
            imageView.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func setupBottomLabel() {
        contentView.addSubview(bottomLabel)
        
        bottomLabel.font = .Roboto.regular.size(of: 14)
        bottomLabel.text = "test label"
        bottomLabel.textColor = AppColors.black //.white
        
        bottomLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bottomLabel.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 5),
            bottomLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
            
        ])
    }
}
