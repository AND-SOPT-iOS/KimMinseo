//
//  SignUpViewController.swift
//  AND-SOPT-iOS
//
//  Created by 김민서 on 11/2/24.
//

import UIKit

import SnapKit
import Then

class SignUpViewController: UIViewController {
    
    // MARK: - UI Properties
    
    private let signUpView: SignUpView = SignUpView()
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHierarchy()
        setLayout()
        setActions()
    }
    
    
    func setHierarchy() {
        self.view.addSubview(signUpView)
    }
    
    func setLayout() {
        self.navigationItem.hidesBackButton = true

        signUpView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
    
    func setActions() {
        signUpView.signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        signUpView.passwordTextField.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
        signUpView.passwordCheckTextField.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
        signUpView.nameTextField.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged) // 추가
        signUpView.hobbyTextField.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
    }
    
    @objc
    func textFieldsDidChange() {
        let isPasswordMatching = signUpView.passwordTextField.text == signUpView.passwordCheckTextField.text
        
        if isPasswordMatching {
            signUpView.passwordMessageLabel.text = "비밀번호가 일치합니다!"
            signUpView.passwordMessageLabel.textColor = .alertBlue
        } else {
            signUpView.passwordMessageLabel.text = "비밀번호가 일치하지 않습니다ㅠㅠ"
            signUpView.passwordMessageLabel.textColor = .alertRed
        }
        
        updateSignUpButtonState(isPasswordMatching: isPasswordMatching)
    }
    
    @objc
    func signUpButtonTapped() {
        guard let username = signUpView.nameTextField.text,
              let password = signUpView.passwordTextField.text,
              let hobby = signUpView.hobbyTextField.text else { return }
        
        
    }
    
}

extension SignUpViewController {
    
    func updateSignUpButtonState(isPasswordMatching: Bool) {
        let isUsernameFilled = !(signUpView.nameTextField.text ?? "").isEmpty
        let isPasswordFilled = !(signUpView.passwordTextField.text ?? "").isEmpty
        let isPasswordCheckFilled = !(signUpView.passwordCheckTextField.text ?? "").isEmpty
        let isHobbyFilled = !(signUpView.hobbyTextField.text ?? "").isEmpty
        
        let isButtonEnabled = isUsernameFilled && isPasswordFilled && isPasswordCheckFilled && isHobbyFilled && isPasswordMatching
        
        signUpView.signUpButton.isEnabled = isButtonEnabled
        signUpView.signUpButton.backgroundColor = isButtonEnabled ? .pink : .medgray
    }
    
    
    }
}


