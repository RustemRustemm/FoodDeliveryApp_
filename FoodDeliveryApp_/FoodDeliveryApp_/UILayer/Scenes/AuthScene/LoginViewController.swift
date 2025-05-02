//
//  LoginViewController.swift
//  FoodDeliveryApp_
//
//  Created by Rustam Shakirzianov on 22.04.2025.
//

import UIKit

enum LoginViewState {
    case initial
    case signIn
    case signUp
}

protocol LoginViewInput: AnyObject {

    func startLoader()
    func stopLoader()
    
    
//    func onSignInTapped()
//    func onSignUpTapped()
//    func onFacebookTapped()
//    func onGoogleTapped()
//    func onForgotTapped()
//    func onBackPressed()
}

class LoginViewController: UIViewController {

    
    //MARK: - Properties
    private var state: LoginViewState = .initial
    var viewOutput: LoginViewOutput!
    private var isKeyboardShown = false
    private var bottomCTValue = 0.0

    
    //MARK: - Views
    private lazy var bottomView = FDBottomView()
    private lazy var titleLabel = UILabel()
    private lazy var signInUsername = FDTextField()
    private lazy var signInPassword = FDTextField()
    private lazy var signUpUsername = FDTextField()
    private lazy var signUpPassword = FDTextField()
    private lazy var signUpReEnterPass = FDTextField()
    private lazy var forgotLabel = UILabel()
    private lazy var logoImage = UIImageView()
    private lazy var signInButton = FDButton()
    private lazy var signUpButton = FDButton()
    private lazy var verticalStack = UIStackView()
    private lazy var loader = UIActivityIndicatorView(style: .large)
    private lazy var loaderContainer = UIView()
    
    //MARK: - Constraints
    private var stackViewBottomCT = NSLayoutConstraint()
    
    
    //MARK: - Initializers
    init(viewOutput: LoginViewOutput, state: LoginViewState) {
        self.viewOutput = viewOutput
        self.state = state
        super.init(nibName: nil, bundle: nil)
    }
    
    //    init(state: LoginViewState, viewOutput: LoginViewOutput) {
    //        self.state = state
    //        self.viewOutput = viewOutput
    //    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        
        super.viewDidLoad()

        view.backgroundColor = .white
        setupLayout()
        setupObservers()
        
//        bottomView.button2Action = facebookPressed
//        bottomView.button1Action = googlePlusPressed
    }
    
    deinit {
        stopKeyboardListener()
    }
    
    func facebookPressed() {
        print("facebookPressed")
    }
    
    func googlePlusPressed() {
        print("googlePlusPressed")
    }
}

//MARK: - Layout
private extension LoginViewController {
    
    //MARK: - setupLayout
    func setupLayout() {
        
        switch state {
        case .initial:
            setupBottomView()
            setupLogoImage()
            setupSignInButton()
            setupSingUpButton()
        case .signIn:
            setupBottomView()
            setupVerticalStack()
            setupSignInPassword()
            setupSignInUsername()
            
            setupTitleLabel()
            setupSignInButton()
            setupForgotLabel()
            setupNavigationBar()

        case .signUp:
            setupBottomView()
            setupVerticalStack()
            setupSignUpUsername()
            setupSignUpPassword()
            setupSignUpReEnterPass()
            
            setupTitleLabel()
            setupSignInButton()
            setupForgotLabel()
            setupNavigationBar()
        }
        setupLoaderView()
    }
    
    func setupNavigationBar() {
        
        let backImage = UIImage(resource: .back)
        let backButtonItem = UIBarButtonItem(image: backImage,
                                             style: .plain,
                                             target: navigationController,
                                             action: #selector(navigationController?.popViewController(animated:)))
        navigationItem.leftBarButtonItem = backButtonItem
        navigationItem.leftBarButtonItem?.tintColor = AppColors.black
    }
    
    //MARK: - setup stack and labels and iamge
    func setupVerticalStack() {
        view.addSubview(verticalStack)
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        verticalStack.axis = .vertical
        verticalStack.spacing = 20

        switch state {
        case .initial:
            return
            
        case .signIn:
            verticalStack.addArrangedSubview(signInUsername)
            verticalStack.addArrangedSubview(signInPassword)
            bottomCTValue = -262
            stackViewBottomCT = verticalStack.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: bottomCTValue)
            
            NSLayoutConstraint.activate([
                verticalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                stackViewBottomCT
            ])
            
        case .signUp:
            verticalStack.addArrangedSubview(signUpUsername)
            verticalStack.addArrangedSubview(signUpPassword)
            verticalStack.addArrangedSubview(signUpReEnterPass)
            bottomCTValue = -227
            stackViewBottomCT = verticalStack.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: bottomCTValue)
            
            NSLayoutConstraint.activate([
                verticalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                stackViewBottomCT
            ])
        }

        
    
    }

    func setupTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .Roboto.bold.size(of: 24)
        
        switch state {
        case .initial:
            print("Initial")
        case .signIn:
            titleLabel.text = "Sign In"
        case .signUp:
            titleLabel.text = "Sign Up"
        }
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: verticalStack.leftAnchor,constant: 4),
            titleLabel.bottomAnchor.constraint(equalTo: verticalStack.topAnchor, constant: -38),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            titleLabel.widthAnchor.constraint(equalToConstant: 354)
        ])
    
    }
    
    func setupForgotLabel() {
        view.addSubview(forgotLabel)
        forgotLabel.translatesAutoresizingMaskIntoConstraints = false
        forgotLabel.font = .Roboto.regular.size(of: 14)
        forgotLabel.textColor = AppColors.bottomViewGrey
        
        NSLayoutConstraint.activate([
            forgotLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor,constant: -30),
            forgotLabel.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 20)
        ])
        
//                switch state {
//                case .initial:
//                    print("Initial")
//                case .signIn:
//                    NSLayoutConstraint.activate([
//                        forgotLabel.rightAnchor.constraint(equalTo: signInButton.rightAnchor,constant: -4),
//                        forgotLabel.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 20),
//                        forgotLabel.heightAnchor.constraint(equalToConstant: 50),
//                    ])
//                case .signUp:
//                    NSLayoutConstraint.activate([
//                        forgotLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor,constant: -4),
//                        forgotLabel.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 20),
//                        forgotLabel.heightAnchor.constraint(equalToConstant: 50),
//                    ])
//                }
    
        forgotLabel.text = "Forgot password?"
    }
    
    func setupLogoImage() {
        view.addSubview(logoImage)
        
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.image = UIImage(resource: .loginLogo)
        logoImage.layer.cornerRadius = 24
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 109),
            logoImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 57),
            logoImage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -57),
            logoImage.heightAnchor.constraint(equalTo: logoImage.widthAnchor)
        ])
    }
    
    //MARK: - setup Sign IN text fields
    func setupSignInUsername() {
        signInUsername.translatesAutoresizingMaskIntoConstraints = false
        signInUsername.placeholder = "Enter your Username"
        
        NSLayoutConstraint.activate([
            signInUsername.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInUsername.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            signInUsername.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            signInUsername.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func setupSignInPassword() {
        signInPassword.translatesAutoresizingMaskIntoConstraints = false
        signInPassword.placeholder = "Enter your password"
//        signInPassword.isSecureTextEntry = true
        
        NSLayoutConstraint.activate([
            signInPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            signInPassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            signInPassword.heightAnchor.constraint(equalToConstant: 50),

        ])
    }
    
    //MARK: - setup Sign UP text fields
    func setupSignUpPassword() {
        
        signUpPassword.translatesAutoresizingMaskIntoConstraints = false
        signUpPassword.placeholder = "Enter your password"
//        signUpPassword.isSecureTextEntry = true
        
        NSLayoutConstraint.activate([

            signUpPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            signUpPassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            signUpPassword.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func setupSignUpUsername() {

        signUpUsername.translatesAutoresizingMaskIntoConstraints = false
        signUpUsername.placeholder = "Enter your Username"
        
        NSLayoutConstraint.activate([
            signUpUsername.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpUsername.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            signUpUsername.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            signUpUsername.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func setupSignUpReEnterPass() {

        signUpReEnterPass.translatesAutoresizingMaskIntoConstraints = false
        signUpReEnterPass.placeholder = "Re-Enter your password"
        signUpReEnterPass.isSecureTextEntry = true
        
        NSLayoutConstraint.activate([

            signUpReEnterPass.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            signUpReEnterPass.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            signUpReEnterPass.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        
        
    }
    
    //MARK: -  setup buttons
    func setupSignInButton() {
        view.addSubview(signInButton)
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.setTitle("Sing In")
        signInButton.scheme = .orange
        signInButton.action = { [weak self] in
            self?.onSignInTapped()
        }
        
        switch state {
        case .initial:
            signInButton.action = onSignInTapped
            NSLayoutConstraint.activate([
                signInButton.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 60),
                signInButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
                signInButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
                signInButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        case .signIn:
            NSLayoutConstraint.activate([
                signInButton.topAnchor.constraint(equalTo: verticalStack.bottomAnchor, constant: 30),
                signInButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
                signInButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
                signInButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        case .signUp:
            NSLayoutConstraint.activate([
                signInButton.topAnchor.constraint(equalTo: verticalStack.bottomAnchor, constant: 30),
                signInButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
                signInButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
                signInButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
    }
    
    func setupSingUpButton() {
        view.addSubview(signUpButton)
        
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.setTitle("Sign Up")
        signUpButton.scheme = .grey
        signUpButton.action = {[weak self]
            in self?.onSignUpTapped()
        }
        
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 20),
            signUpButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            signUpButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            signUpButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    //MARK: -  setup Bottom View
    func setupBottomView() {
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        
//        bottomView.button2Action = facebookPressed //сильная ссылка - надо убрать
//        bottomView.button1Action = googlePlusPressed //сильная ссылка - надо убрать
        
        bottomView.button2Action = { [weak self] in self?.facebookPressed() }
        bottomView.button1Action = { [weak self] in self?.googlePlusPressed() }
        
        NSLayoutConstraint.activate([
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    func setupLoaderView() {
        view.addSubview(loaderContainer)
        loaderContainer.translatesAutoresizingMaskIntoConstraints = false
        loaderContainer.backgroundColor = AppColors.black.withAlphaComponent(0.3)
        loaderContainer.isHidden = true
        
        NSLayoutConstraint.activate([
            loaderContainer.widthAnchor.constraint(equalTo: view.widthAnchor),
            loaderContainer.heightAnchor.constraint(equalTo: view.heightAnchor),
        ])
        
        loader.translatesAutoresizingMaskIntoConstraints = false
        loaderContainer.addSubview(loader)
        
        NSLayoutConstraint.activate([
            loader.centerXAnchor.constraint(equalTo: loaderContainer.centerXAnchor),
            loader.centerYAnchor.constraint(equalTo: loaderContainer.centerYAnchor),
            
        ])
    }
    
}

//MARK: - Observers
private extension LoginViewController {
    
    func setupObservers() {
        startKeyboardListener()
    }
    
    func startKeyboardListener() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_ :)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_ :)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_ :)))
        view.addGestureRecognizer(tapGesture)
    }
    
    func stopKeyboardListener() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        
        let keyboardHeight = keyboardFrame.cgRectValue.height
        
        if !isKeyboardShown {
            UIView.animate(withDuration: 0.3) {
                self.stackViewBottomCT.constant -= keyboardHeight / 4
                self.view.layoutIfNeeded()
                self.isKeyboardShown = true
            }
        }
        
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        if isKeyboardShown {
            UIView.animate(withDuration: 0.3) {
                self.stackViewBottomCT.constant = self.bottomCTValue
                self.view.layoutIfNeeded()
                self.isKeyboardShown = false
            }
        }
    }
    
}

//MARK: - Private methods
private extension LoginViewController {
    
    func onSignInTapped() {
        switch state {
        case .initial:
            viewOutput.goToSignIn()
        case .signIn:
            print(#function)
            viewOutput.loginStart(login: signInUsername.text ?? "", password: signInPassword.text ?? "")
        case .signUp:
            return
        }
        
    }
    
    func onSignUpTapped() {
        switch state {
        case .initial:
            viewOutput.goToSignUp()
        case .signIn:
            return
        case .signUp:
            return
        }
    }
    
    func onFacebookTapped() {
        
    }
    
    func onGoogleTapped() {
        
    }
    
    func onForgotTapped() {
        
    }
    
    func onBackPressed() {
        
    }

}

//MARK: - LoginViewInput delegate
extension LoginViewController: LoginViewInput {
    func startLoader() {
        loaderContainer.isHidden = false
        loader.startAnimating()
    }
    
    func stopLoader() {
        loaderContainer.isHidden = true
        loader.stopAnimating()
    }

}




//#Preview("LoginVC") {
//    let presenter = LoginPresenter()
//    LoginViewController(viewOutput: presenter, state: .signUp)
//}
