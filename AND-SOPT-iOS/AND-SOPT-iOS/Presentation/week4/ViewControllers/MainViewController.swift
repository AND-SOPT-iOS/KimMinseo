//
//  MainViewController.swift
//  AND-SOPT-iOS
//
//  Created by 김민서 on 11/7/24.
//

import UIKit

import SnapKit
import Then

class MainViewController: UIViewController {
    
    // MARK: - UI Properties
    
    private let mainView: MainView = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getMyHobby()
        setHierarchy()
        setLayout()
        setActions()
    }
    
    
    func setHierarchy() {
        self.view.addSubview(mainView)
    }
    
    func setLayout() {
        self.navigationItem.hidesBackButton = true
        
        mainView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
    
    func setActions() {
        mainView.searchButton.addTarget(self, action: #selector(searchButtonTap), for: .touchUpInside)
    }
    
    func fetchToken() -> String? {
        return UserDefaults.standard.string(forKey: "userToken")
    }
    
    @objc
    func searchButtonTap() {
        if let userNoText = mainView.searchHobbyTextField.text,
           let userNo = Int(userNoText) {
            getHobby(userNo: userNo)
        }
    }
}

extension MainViewController {
    
    func getMyHobby() {
        guard let token = fetchToken() else {
            print("토큰 없음")
            return
        }
        
        HobbyService().getUserHobby(token: token) { result in
            switch result {
            case .success(let response):
                if let hobby = response.result?.hobby {
                    self.mainView.myHobbyInfoLabel.text = hobby
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func getHobby(userNo: Int) {
        HobbyService().getHobby(userNo: userNo) { result in
            switch result {
            case .success(let response):
                if let hobby = response.result?.hobby {
                    self.mainView.resultHobbyLabel.text = hobby
                } else {
                    print("취미 없음")
                }
            case .failure(let error):
                self.mainView.resultHobbyLabel.text = "잘못된 번호"
            }
        }
    }
}
