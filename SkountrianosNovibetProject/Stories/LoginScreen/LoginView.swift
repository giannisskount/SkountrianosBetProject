//
//  LoginView.swift
//  SkountrianosNovibetProject
//
//  Created by Ιωάννης Σκουντριάνος on 10/9/22.
//

import UIKit

final class LoginView: UIView {

    lazy var loginTextField: UITextField = {
        
        let usernameTextField = UITextField()
        
        usernameTextField.placeholder = "Enter username"
        usernameTextField.backgroundColor = UIColor.black
        usernameTextField.textColor = .white
        
        usernameTextField.layer.cornerRadius = 15.0
        usernameTextField.borderStyle = .roundedRect
        
        usernameTextField.layer.borderColor = BetColor.primaryColor.cgColor
        usernameTextField.clipsToBounds = true
        
        return usernameTextField
    }()
    
    
    lazy var passwordTextField: UITextField = {
        
        let passwordTextField = UITextField()
        
        passwordTextField.isSecureTextEntry = true
        passwordTextField.placeholder = "Enter password"
        passwordTextField.textColor = .white
        
        passwordTextField.layer.cornerRadius = 15.0
        passwordTextField.borderStyle = .roundedRect

        passwordTextField.layer.borderColor = BetColor.primaryColor.cgColor
        passwordTextField.clipsToBounds = true
    
        return passwordTextField
    }()
    
    lazy var loginButton = LoginButton()
    lazy var activityIndicator = UIActivityIndicatorView.init(style: .medium)

    var isLoading: Bool = false {
        didSet { isLoading ? startLoading() : finishLoading() }
    }

    init() {
        super.init(frame: .zero)

        addSubviews()
        setUpConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func startLoading() {
        isUserInteractionEnabled = false
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }

    func finishLoading() {
        isUserInteractionEnabled = true
        activityIndicator.stopAnimating()
    }

    private func addSubviews() {
        [loginTextField, passwordTextField, loginButton, activityIndicator]
            .forEach {
                addSubview($0)
                $0.translatesAutoresizingMaskIntoConstraints = false
            }
    }

    private func setUpConstraints() {

        NSLayoutConstraint.activate([
            loginTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            loginTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -30.0),
            loginTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40.0),
            loginTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40.0),
            loginTextField.heightAnchor.constraint(equalToConstant: 60.0),

            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 10.0),
            passwordTextField.centerXAnchor.constraint(equalTo: loginTextField.centerXAnchor),
            passwordTextField.widthAnchor.constraint(equalTo: loginTextField.widthAnchor, multiplier: 1.0),
            passwordTextField.heightAnchor.constraint(equalTo: loginTextField.heightAnchor),

            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20.0),
            loginButton.centerXAnchor.constraint(equalTo: loginTextField.centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 120.0),
            loginButton.heightAnchor.constraint(equalToConstant: 30.0),

            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
            activityIndicator.heightAnchor.constraint(equalToConstant: 100),
            activityIndicator.widthAnchor.constraint(equalToConstant: 100.0)
        ])
    }
}
