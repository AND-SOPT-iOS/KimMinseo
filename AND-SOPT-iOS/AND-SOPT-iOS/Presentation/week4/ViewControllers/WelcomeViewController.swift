//
//  WelcomeViewController.swift
//  AND-SOPT-iOS
//
//  Created by 김민서 on 11/7/24.
//

import UIKit

import SnapKit
import Then

class WelcomeViewController: UIViewController {
    
    // MARK: - UI Properties
    
    private let welcomeView: WelcomeView = WelcomeView()
    
    // MARK: - Properties
    
    var username: String?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setWelcomeLabel()
        setHierarchy()
        setLayout()
        setActions()
    }
    
    
    func setHierarchy() {
        self.view.addSubview(welcomeView)
    }
    
    func setLayout() {
        self.navigationItem.hidesBackButton = true
        
        welcomeView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
    
    func setActions() {
        welcomeView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    @objc
    func loginButtonTapped() {
        let loginViewController = LoginViewController()
        self.navigationController?.pushViewController(loginViewController, animated: true)
    }
    
}

extension WelcomeViewController {
    
    func setWelcomeLabel() {
        if let username = username {
            welcomeView.congratulationLabel.do {
                $0.setLabel(text: "가입 완료!\n\(username)님, 환영해요!", textColor: .black, fontName: "SUIT-Bold", fontSize: 20)
                $0.setColorForText("가입 완료!", with: .pink)
            }
        } 
    }
    
}
