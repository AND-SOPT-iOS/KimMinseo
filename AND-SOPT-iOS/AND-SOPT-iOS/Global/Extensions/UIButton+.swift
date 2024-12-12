//
//  UIButton+.swift
//  AND-SOPT-iOS
//
//  Created by 김민서 on 11/4/24.
//

import UIKit

extension UIButton {
    
    func setButton(title: String? = "",
                   backgroundColor: UIColor = .pink,
                   titleColor: UIColor = .white,
                   font: UIFont = UIFont(name: "SUIT-SemiBold", size: 17) ?? .systemFont(ofSize: 17),
                   cornerRadius: CGFloat = 7,
                   borderWidth: CGFloat = 0,
                   borderColor: UIColor = .clear) {
        
        self.setTitle(title, for: .normal)
        self.backgroundColor = backgroundColor
        self.setTitleColor(titleColor, for: .normal)
        self.titleLabel?.font = font
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
}
