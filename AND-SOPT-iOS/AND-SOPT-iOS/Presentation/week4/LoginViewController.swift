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
    

    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getUserToken()
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    func setStyle() {
     
    }
    
    func setHierarchy() {

    }
    
    func setLayout() {


    }
    
    func getUserToken() {
        AuthService().register(username: "minseo02", password: "123") { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }

                switch result {
                case let .success(token):
                    print("Received Token: \(token)") // 콘솔에 토큰 출력
                case let .failure(error):
                    print("Error: \(error.errorMessage)")
                }
            }
        }
    }

    
    
}

