//
//  UIStackView+.swift
//  AND-SOPT-iOS
//
//  Created by 김민서 on 10/26/24.
//

import UIKit

extension UIStackView {
    
    func addArrangedSubviews(_ views: UIView...) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
    
}


