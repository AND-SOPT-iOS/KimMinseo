//
//  LoginViewController.swift
//  AND-SOPT-iOS
//
//  Created by 김민서 on 11/2/24.
//

import UIKit

import SnapKit
import Then

class LoginViewController: UIViewController {
    
    // MARK: - UI Properties
    
    private let loginView: LoginView = LoginView()
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHierarchy()
        setLayout()
        setActions()
    }
    
    
    func setHierarchy() {
        self.view.addSubview(loginView)
    }
    
    func setLayout() {
        loginView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
    
    func setActions() {
        loginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginView.signUpLabel.addTarget(self, action: #selector(signUpLabelTapped), for: .touchUpInside)
    }
    
    @objc
    func loginButtonTapped() {
        guard let username = loginView.nameTextField.text, !username.isEmpty,
              let password = loginView.passwordTextField.text, !password.isEmpty else {
            print("이름과 비밀번호를 입력해주세요.")
            return
        }
        postUserInfo(username: username, password: password)
        
        let mainViewController = MainViewController()
        self.navigationController?.pushViewController(mainViewController, animated: true)
    }
    
    @objc
    func signUpLabelTapped() {
        let signUpViewController = SignUpViewController()
        self.navigationController?.pushViewController(signUpViewController, animated: true)
    }
    
}

extension LoginViewController {
    
    func postUserInfo(username: String, password: String) {
        AuthService().postUserInfo(username: username, password: password) { [weak self] result in
            DispatchQueue.main.async {
                guard self != nil else { return }
                
                switch result {
                case let .success(token):
                    print("Received Token: \(token)")
                case let .failure(error):
                    print("🌟 Error: \(error.errorMessage)")
                }
            }
        }
    }
}


