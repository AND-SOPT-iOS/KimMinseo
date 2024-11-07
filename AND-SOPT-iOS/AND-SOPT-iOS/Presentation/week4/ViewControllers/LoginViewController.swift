//
//  LoginViewController.swift
//  AND-SOPT-iOS
//
//  Created by 김민서 on 11/2/24.
//

import UIKit

import SnapKit
import Then

class LoginViewController: UIViewController {
    
    // MARK: - UI Properties
    
    private let loginView: LoginView = LoginView()
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHierarchy()
        setLayout()
    }
    
    
    func setHierarchy() {
        self.view.addSubview(loginView)
    }
    
    func setLayout() {
        loginView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

    }

}


