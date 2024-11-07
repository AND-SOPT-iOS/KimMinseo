//
//  SignUpView.swift
//  AND-SOPT-iOS
//
//  Created by 김민서 on 11/2/24.
//


import UIKit

import SnapKit
import Then

class SignUpView: UIView {
    
    // MARK: - UI Properties

    private let titleLabel: UILabel = UILabel()
        
    private let numLabel1: UIImageView = UIImageView(image: .num1)
    
    private let nameLabel: UILabel = UILabel()
    
    let nameTextField: UITextField = UITextField()
    
    private let numLabel2: UIImageView = UIImageView(image: .num2)
    
    private let passwordLabel: UILabel = UILabel()
    
    let passwordTextField: UITextField = UITextField()
    
    let passwordCheckTextField: UITextField = UITextField()
    
    let passwordMessageLabel: UILabel = UILabel()
        
    private let numLabel3: UIImageView = UIImageView(image: .num3)
    
    private let hobbyLabel: UILabel = UILabel()
    
    let hobbyTextField: UITextField = UITextField()
    
    let signUpButton: UIButton = UIButton()
    
    
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
        self.addSubviews(titleLabel, numLabel1, nameLabel, nameTextField, numLabel2, passwordLabel, passwordTextField, passwordCheckTextField, passwordMessageLabel, numLabel3, hobbyLabel, hobbyTextField, signUpButton)
    }
    
    func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(90)
            $0.centerX.equalToSuperview()
        }
    
        numLabel1.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(39)
            $0.leading.equalToSuperview().inset(16)
            $0.size.equalTo(23)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(numLabel1.snp.bottom).offset(10)
            $0.leading.equalTo(numLabel1)
        }
        
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(9)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(54)
        }
        
        numLabel2.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(21)
            $0.leading.equalTo(numLabel1)
            $0.size.equalTo(23)
        }
        
        passwordLabel.snp.makeConstraints {
            $0.top.equalTo(numLabel2.snp.bottom).offset(10)
            $0.leading.equalTo(numLabel2)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(passwordLabel.snp.bottom).offset(9)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(54)
        }
        
        passwordCheckTextField.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(8)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(54)
        }
        
        passwordMessageLabel.snp.makeConstraints {
            $0.top.equalTo(passwordCheckTextField.snp.bottom).offset(8)
            $0.leading.equalTo(passwordCheckTextField)
        }
    
        numLabel3.snp.makeConstraints {
            $0.top.equalTo(passwordCheckTextField.snp.bottom).offset(39)
            $0.leading.equalTo(numLabel1)
            $0.size.equalTo(23)
        }
        
        hobbyLabel.snp.makeConstraints {
            $0.top.equalTo(numLabel3.snp.bottom).offset(10)
            $0.leading.equalTo(numLabel1)
        }
        
        hobbyTextField.snp.makeConstraints {
            $0.top.equalTo(hobbyLabel.snp.bottom).offset(9)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(54)
        }
        
        signUpButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(32)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(54)
        }
    
        
    }
    
    func setStyle() {
        self.backgroundColor = .white
        
        titleLabel.do {
            $0.setLabel(text:"회원가입", textColor: .pink, fontName: "SUIT-Bold", fontSize: 20)
        }
        
        nameLabel.do {
            $0.setLabel(text:"유저 이름을 입력해주세요!", textColor: .black, fontSize: 15)
        }
        
        nameTextField.do {
            $0.setStyle(placeholder: "8자 이하")
        }
        
        passwordLabel.do {
            $0.setLabel(text:"비밀번호를 입력해주세요!", textColor: .black, fontSize: 15)
        }
        
        passwordTextField.do {
            $0.setStyle(placeholder: "비밀번호 입력 (8자 이하)")
        }
        
        passwordCheckTextField.do {
            $0.setStyle(placeholder: "비밀번호 확인")
        }
        
        hobbyLabel.do {
            $0.setLabel(text:"나의 취미를 입력해주세요!", textColor: .black, fontSize: 15)
        }
        
        hobbyTextField.do {
            $0.setStyle(placeholder: "8자 이하")
        }
        
        passwordMessageLabel.do {
            $0.setLabel(textColor: .lightblue, fontSize: 11)
        }
        
     
        signUpButton.do {
            $0.setButton(title: "회원 가입", backgroundColor: .medgray)
        }
        
        
    }
    
}

