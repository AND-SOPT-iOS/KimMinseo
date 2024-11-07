//
//  UILabel+.swift
//  AND-SOPT-iOS
//
//  Created by 김민서 on 11/2/24.
//

import UIKit

extension UILabel {
    
    // 기본 라벨 속성 설정 메소드
    func setLabel(
        text: String? = "",
        alignment: NSTextAlignment = .center,
        numberOfLines: Int = 0,
        textColor: UIColor,
        fontName: String = "SUIT-SemiBold",
        fontSize: CGFloat = 13
    ) {
        self.text = text
        self.textAlignment = alignment
        self.numberOfLines = numberOfLines
        self.textColor = textColor
        self.font = UIFont(name: fontName, size: fontSize) ?? .systemFont(ofSize: fontSize)
    }
    
}
