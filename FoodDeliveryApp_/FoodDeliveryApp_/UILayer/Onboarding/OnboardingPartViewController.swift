//
//  OnboardingPartViewController.swift
//  FoodDeliveryApp_
//
//  Created by Rustam Shakirzianov on 20.04.2025.
//

import UIKit

//MARK: - OnboardingPartViewController
class OnboardingPartViewController: UIViewController {
    
    //MARK: - Properties
    var imageToShow: UIImage? {
        didSet {
            imageView.image = imageToShow
        }
    }
    var titleText: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    var descriptionText: String? {
        didSet {
            descriptionLabel.text = descriptionText
        }
    }
    
    var buttonText: String?
    
    //MARK: - Views
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
//    private let bottomButton = UIButton()
    
    
//    //MARK: - Initializers
//    init(imageToShow: UIImage, titleText: String, descriptionText: String) {
//        self.imageToShow = imageToShow
//        self.titleText = titleText
//        self.descriptionText = descriptionText
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
  
    }
    

}

//MARK: - Layout
private extension OnboardingPartViewController {
    
    func setupLayout() {
        setupView()
        setupImageView()
        setupTitle()
        setupDescription()
//        setupBottomButton()
    }
    
    func setupView() {
        view.backgroundColor = AppColors.accentOrange
    }
    
    func setupImageView() {
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func setupTitle() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .Roboto.bold.size(of: 24)
        titleLabel.textColor = AppColors.white
        titleLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

        ])
        
    }
    
    func setupDescription() {
        view.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = .Roboto.regular.size(of: 14)
        descriptionLabel.textColor = AppColors.white
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 23),
//            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor), //error - it is not compatible with leadingAnchor and trailingAnchor
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 71),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -72)
            
        ])
    }

}
