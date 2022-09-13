//
//  LoginViewController.swift
//  SkountrianosNovibetProject
//
//  Created by Ιωάννης Σκουντριάνος on 9/9/22.
//

import UIKit
import Combine

class LoginViewController: UIViewController {
    
    var stackView: UIStackView?
    var userNameTextfield: UITextField?
    var passwordTextfield: UITextField?
    var loginButton: LoginButton?
    
    private lazy var contentView = LoginView()
    private var viewModel: LoginViewModel = LoginViewModel()
    private var subscriptions = Set<AnyCancellable>()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .black
        self.navigationController?.navigationBar.isHidden = true
        
        self.setupGestures()
        self.setupActions()
        self.setupSubscriptions()
    }
    
    private func setupGestures() {
        // Recognize if user taps anywhere on the screen
        let tap = UITapGestureRecognizer(target: self, action: #selector(shouldDismissKeyboard))
        self.contentView.addGestureRecognizer(tap)
    }
    
    private func setupActions() {
        self.contentView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    private func setupSubscriptions() {
        
        // Bind View with ViewModel
        contentView.loginTextField.textPublisher
            .receive(on: RunLoop.main)
            .sink(receiveValue: { usernameText in
                self.viewModel.updateUsername(usernameText)
            })
            .store(in: &subscriptions)
        
        contentView.passwordTextField.textPublisher
            .receive(on: RunLoop.main)
            .sink(receiveValue: { passwordText in
                self.viewModel.updatePassword(passwordText)
            })
            .store(in: &subscriptions)
        
        // Bind ViewModel with View
        viewModel.validateInput
            .receive(on: DispatchQueue.main)
            .assign(to: \.isEnabled, on: contentView.loginButton)
            .store(in: &subscriptions)
        
        viewModel.$isLoading
            .receive(on: DispatchQueue.main)
            .assign(to: \.isLoading, on: contentView)
            .store(in: &subscriptions)
        
        viewModel.credentialsValidationResult
            .receive(on: DispatchQueue.main)
            .sink { validationResult in
                switch validationResult {
                case .success(let token):
                    self.logIn(bearerToken: token)
                case .failure:
                    self.contentView.loginButton.shake()
                }
            }
            .store(in: &subscriptions)
        
    }
    
    @objc func loginButtonTapped(_ sender: UIButton) {
        self.viewModel.performLogin()
    }
    
    @objc func shouldDismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        self.contentView.endEditing(true)
    }
    
    private func logIn(bearerToken: String) {
        
        let menuViewModel = MenuViewModel.init(bearerToken: bearerToken)
        let menuViewController = MenuViewController.init(viewModel: menuViewModel)
        navigationController?.pushViewController(menuViewController, animated: true)
    }
}

// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
}
