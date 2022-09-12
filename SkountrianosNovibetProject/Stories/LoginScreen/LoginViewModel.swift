//
//  LoginViewModel.swift
//  SkountrianosNovibetProject
//
//  Created by Ιωάννης Σκουντριάνος on 10/9/22.
//

import Foundation
import Combine

enum LoginValidationResult {
    case success(token: String)
    case failure
}

class LoginViewModel {
    
    @Published var loginModel: LoginModel = LoginModel()
    @Published var isLoading = false
    
    let credentialsValidationResult = PassthroughSubject<LoginValidationResult, Never>()
   
    private(set) lazy var validateInput: AnyPublisher<Bool, Never> = $loginModel
        .map { [weak self] model in
            self?.validateInputs() ?? false
        }
        .eraseToAnyPublisher()
    
    init() {
    }
    
    private func validateInputs() -> Bool {
        
        let isUsernameValid = self.validateUsername(with: self.loginModel.username)
        let isPasswordValid = self.validatePassword(with: self.loginModel.password)
        
        return isUsernameValid && isPasswordValid
    }
    
    private func validateUsername(with username: String) -> Bool {
        
        guard username.count >= 5 else {
            return false
        }
        
        return true
    }
    
    private func validatePassword(with password: String) -> Bool {
        
        guard password.count >= 5 else {
            return false
        }
        
        return true
    }
    
    func updateUsername(_ updatedUsername: String) {
        self.loginModel.username = updatedUsername
    }
    
    func updatePassword(_ updatedPassword: String) {
        self.loginModel.password = updatedPassword
    }
    
    func performLogin() {
        
        print("Login with username: \(self.loginModel.username) & password: \(self.loginModel.password)")
        
        isLoading = true
        LoginNetworkService.loginCall { [weak self] response, error in
            
            self?.isLoading = false
            if let bearerToken = response?.accessToken {
                self?.credentialsValidationResult.send(.success(token: bearerToken))
            } else {
                self?.credentialsValidationResult.send(.failure)
            }
        }
    }
    
}
