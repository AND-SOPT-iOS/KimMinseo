//
//  MainView.swift
//  AND-SOPT-iOS
//
//  Created by 김민서 on 11/7/24.
//

import UIKit

import SnapKit
import Then

class MainView: UIView {
    
    // MARK: - UI Properties
    
    private let hobbyImage: UIImageView = UIImageView(image: .hobby)
    
    private let myHobbyLabel: UILabel = UILabel()
    
    let myHobbyInfoLabel: PaddedLabel = PaddedLabel()
    
    private let searchHobbyLabel: UILabel = UILabel()
    
    let searchHobbyTextField: UITextField = UITextField()
    
    let searchButton: UIButton = UIButton()
    
    let resultHobbyLabel: PaddedLabel = PaddedLabel()
    
    private let editInfoButton: UIButton = UIButton()
    
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
        self.addSubviews(hobbyImage, myHobbyLabel, myHobbyInfoLabel, searchHobbyLabel, searchHobbyTextField, searchButton, resultHobbyLabel, editInfoButton)
    }
    
    func setLayout() {
        hobbyImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(169)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(255)
            $0.height.equalTo(202)
        }
        
        myHobbyLabel.snp.makeConstraints {
            $0.top.equalTo(hobbyImage.snp.bottom).offset(50)
            $0.leading.equalToSuperview().inset(16)
        }
        
        myHobbyInfoLabel.snp.makeConstraints {
            $0.top.equalTo(myHobbyLabel.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(54)
        }
        
        searchHobbyLabel.snp.makeConstraints {
            $0.top.equalTo(myHobbyInfoLabel.snp.bottom).offset(23)
            $0.leading.equalToSuperview().inset(16)
        }
        
        searchHobbyTextField.snp.makeConstraints {
            $0.top.equalTo(searchHobbyLabel.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(54)
        }
        
        searchButton.snp.makeConstraints {
            $0.centerY.equalTo(searchHobbyTextField)
            $0.trailing.equalTo(searchHobbyTextField).inset(13)
            $0.size.equalTo(20)
        }
        
        resultHobbyLabel.snp.makeConstraints {
            $0.top.equalTo(searchHobbyTextField.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(54)
        }
        
        editInfoButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(32)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(54)
        }
        
    }
    
    func setStyle() {
        self.backgroundColor = .white
        
        myHobbyLabel.do {
            $0.setLabel(text: "내 취미", textColor: .pink, fontSize: 17)
        }
        
        myHobbyInfoLabel.do {
            $0.setLabel(text: "내 취미", alignment: .left, textColor: .black)
            $0.backgroundColor = .lightgray
            $0.layer.cornerRadius = 7
            $0.clipsToBounds = true
            $0.setLeftPadding(padding: 17)
        }
        
        searchHobbyLabel.do {
            $0.setLabel(text: "취미 둘러보기", textColor: .pink, fontSize: 17)
        }
        
        searchHobbyTextField.do {
            $0.setStyle(placeholder: "숫자 입력")
        }
        
        searchButton.do {
            $0.setImage(.search, for: .normal)
        }
        
        resultHobbyLabel.do {
            $0.setLabel(alignment: .left, textColor: .black )
            $0.backgroundColor = .lightgray
            $0.layer.cornerRadius = 7
            $0.clipsToBounds = true
            $0.setLeftPadding(padding: 17)
        }
        
        editInfoButton.do {
            $0.setButton(title: "내 정보 수정하기")
        }
    }
    
}


