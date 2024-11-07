//
//  SignUpViewController.swift
//  AND-SOPT-iOS
//
//  Created by 김민서 on 11/2/24.
//

import UIKit

import SnapKit
import Then

class SignUpViewController: UIViewController {
    
    // MARK: - UI Properties
    
    private let signUpView: SignUpView = SignUpView()
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getUserToken()
        setHierarchy()
        setLayout()
    }
    
    
    func setHierarchy() {
        self.view.addSubview(signUpView)
    }
    
    func setLayout() {
        signUpView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

    }
}


