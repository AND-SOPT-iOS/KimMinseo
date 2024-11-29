//
//  TossViewController.swift
//  AND-SOPT-iOS
//
//  Created by 김민서 on 11/29/24.
//

import UIKit
import SwiftUI

class AppStoreViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // SwiftUI 뷰를 생성
        let appStoreView = AppStoreView()
        
        // UIHostingController로 SwiftUI 화면을 UIKit에 통합
        let hostingController = UIHostingController(rootView: appStoreView)
        
        // SwiftUI 화면을 현재 뷰 컨트롤러에 추가
        addChild(hostingController)
        view.addSubview(hostingController.view)
        
        // 레이아웃 설정
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        hostingController.didMove(toParent: self)
    }
}
