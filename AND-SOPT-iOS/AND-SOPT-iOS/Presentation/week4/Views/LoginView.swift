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
    
    private let nameLabel: UILabel = UILabel()
    
    private let nameTextField: UITextField = UITextField()
    
    private let passwordLabel: UILabel = UILabel()
    
    private let passwordTextField: UITextField = UITextField()
    
    private let numLabel3: UIImageView = UIImageView(image: .num3)
    
    private let loginButton: UIButton = UIButton()
    
    
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
        self.addSubviews(titleLabel, nameLabel, nameTextField, passwordLabel, passwordTextField, loginButton)
    }
    
    func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(144)
            $0.centerX.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(51)
            $0.leading.equalToSuperview().inset(16)
        }
        
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(9)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(54)
        }
        
        passwordLabel.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(20)
            $0.leading.equalTo(nameLabel)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(passwordLabel.snp.bottom).offset(9)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(54)
        }
    
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(34)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(54)
        }
    }
    
    func setStyle() {
        self.backgroundColor = .white
        
        titleLabel.do {
            $0.setLabel(text:"로그인", textColor: .pink, fontName: "SUIT-Bold", fontSize: 20)
        }
        
        nameLabel.do {
            $0.setLabel(text:"유저 이름을 입력해주세요!", textColor: .pink, fontSize: 15)
        }
        
        nameTextField.do {
            $0.setStyle(placeholder: "유저 이름 입력 (8자 이하)")
        }
        
        passwordLabel.do {
            $0.setLabel(text:"비밀번호", textColor: .pink, fontSize: 15)
        }
        
        passwordTextField.do {
            $0.setStyle(placeholder: "비밀번호 입력 (8자 이하)")
        }
     
        loginButton.do {
            $0.setButton(title: "로그인")
        }
        
        
    }
    
}

