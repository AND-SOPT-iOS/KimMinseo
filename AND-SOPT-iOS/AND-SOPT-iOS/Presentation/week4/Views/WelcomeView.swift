//
//  WelcomeView.swift
//  AND-SOPT-iOS
//
//  Created by 김민서 on 11/7/24.
//

import UIKit

import SnapKit
import Then

class WelcomeView: UIView {
    
    // MARK: - UI Properties

    private let congratulationImage: UIImageView = UIImageView(image: .congratulation)
    
    let congratulationLabel: UILabel = UILabel()
    
    let loginButton: UIButton = UIButton()

    
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
        self.addSubviews(congratulationImage, congratulationLabel, loginButton)
    }
    
    func setLayout() {
        self.backgroundColor = .white
        
        congratulationImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(215)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(114)
            $0.height.equalTo(109)
        }
        
        congratulationLabel.snp.makeConstraints {
            $0.top.equalTo(congratulationImage.snp.bottom).offset(23)
            $0.centerX.equalToSuperview()
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(congratulationLabel.snp.bottom).offset(42)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(54)
        }
        
    }
    
    func setStyle() {
        congratulationLabel.do {
            $0.setLabel(text: "가입 완료!\n민서공이님, 환영해요!", textColor: .black, fontName: "SUIT-Bold", fontSize: 20)
            $0.setColorForText("가입 완료!", with: .pink)
        }
        
        loginButton.do {
            $0.setButton(title: "로그인하러 가기")
        }
    }
    
}


