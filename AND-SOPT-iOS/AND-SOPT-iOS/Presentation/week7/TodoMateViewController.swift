//
//  TodoMateViewController.swift
//  AND-SOPT-iOS
//
//  Created by 김민서 on 12/12/24.
//

import UIKit
import SwiftUI

import SnapKit
import Then

class TodoMateViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let appStoreView = TodoMateView()
        
        let hostingController = UIHostingController(rootView: appStoreView)
        
        addChild(hostingController)
        view.addSubview(hostingController.view)
        
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        
        hostingController.view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        hostingController.didMove(toParent: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}

