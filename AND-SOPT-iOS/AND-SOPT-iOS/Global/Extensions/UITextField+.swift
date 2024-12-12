//
//  UITextField+.swift
//  AND-SOPT-iOS
//
//  Created by 김민서 on 11/4/24.
//

import UIKit

extension UITextField {
    
    func setStyle(placeholder: String, font: UIFont = UIFont(name: "SUIT-SemiBold", size: 13) ?? .systemFont(ofSize: 13), backgroundColor: UIColor = UIColor(resource: .lightgray), textColor: UIColor = .black, cornerRadius: CGFloat = 7, leftPadding: CGFloat = 17) {
        
        self.font = font
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: leftPadding, height: self.frame.height))
        self.leftViewMode = .always
        self.textColor = textColor

        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.darkgray,
            .font: font
        ]
        
        self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
    }
}
