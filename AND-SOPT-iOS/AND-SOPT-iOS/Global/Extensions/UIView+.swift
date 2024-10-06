//
//  UIView+.swift
//  AND-SOPT-iOS
//
//  Created by 김민서 on 10/6/24.
//

import UIKit

extension UIView {
    
    // UIView 여러 개 인자로 받아서 한 번에 addSubview하는 메소드
    func addSubviews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
}

