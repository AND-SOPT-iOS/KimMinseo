//
//  PaddedLabel.swift
//  AND-SOPT-iOS
//
//  Created by 김민서 on 11/7/24.
//

import UIKit

class PaddedLabel: UILabel {
    
    // textInsets 프로퍼티 추가
    var textInsets: UIEdgeInsets = .zero
    
    override func drawText(in rect: CGRect) {
        // 패딩을 적용하여 텍스트를 그립니다.
        let insetRect = rect.inset(by: textInsets)
        super.drawText(in: insetRect)
    }
    
    // textInsets을 설정하는 메서드
    func setLeftPadding(padding: CGFloat) {
        self.textInsets = UIEdgeInsets(top: 0, left: padding, bottom: 0, right: 0)
        // 레이아웃을 다시 업데이트
        setNeedsLayout()
    }
}

