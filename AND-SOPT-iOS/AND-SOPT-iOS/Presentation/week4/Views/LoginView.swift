//
//  LoginView.swift
//  AND-SOPT-iOS
//
//  Created by 김민서 on 11/6/24.
//

import UIKit

import SnapKit
import Then

class LoginView: UIView {
    
    // MARK: - UI Properties

    private let titleLabel: UILabel = UILabel()
        
    let nameTextField: UITextField = UITextField()
        
    let passwordTextField: UITextField = UITextField()
    
    private let numLabel3: UIImageView = UIImageView(image: .num3)
    
    let loginButton: UIButton = UIButton()
    
    let signUpLabel: UIButton = UIButton()
    
    
    // MARK: - Properties
    
    private let attributes: [NSAttributedString.Key: Any] = [
        .foregroundColor: UIColor.darkgray,
        .font: UIFont(name: "SUIT-SemiBold", size: 13) ?? UIFont.systemFont(ofSize: 13)
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierarchy()
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setHierarchy() {
        self.addSubviews(titleLabel, nameTextField, passwordTextField, loginButton, signUpLabel)
    }
    
    func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(144)
            $0.centerX.equalToSuperview()
        }
        
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(108)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(54)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(54)
        }
    
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(34)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(54)
        }
        
        signUpLabel.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(17)
            $0.centerX.equalToSuperview()
        }
    }
    
    func setStyle() {
        self.backgroundColor = .white
        
        titleLabel.do {
            $0.setLabel(text:"로그인", textColor: .pink, fontName: "SUIT-Bold", fontSize: 20)
        }
        
        nameTextField.do {
            $0.setStyle(placeholder: "유저 이름 입력 (8자 이하)")
        }

        passwordTextField.do {
            $0.setStyle(placeholder: "비밀번호 입력 (8자 이하)")
        }
     
        loginButton.do {
            $0.setButton(title: "로그인")
        }
        
        signUpLabel.do {
            $0.setButton(title: "처음 오셨나요? 회원가입 하기", backgroundColor: .clear,titleColor: .darkgray,font: UIFont(name: "SUIT-SemiBold", size: 13) ?? .systemFont(ofSize: 13))
        }
        
        
    }

}

