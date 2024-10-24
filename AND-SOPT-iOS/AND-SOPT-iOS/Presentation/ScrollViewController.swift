//
//  TossDetailViewController.swift
//  AND-SOPT-iOS
//
//  Created by 김민서 on 10/12/24.
//

import UIKit

import SnapKit
import Then

class TossDetailViewController: UIViewController {
    
    // MARK: - UI Properties
    
    private let scrollView = UIScrollView()
    
    private var contentView = UIView()
    
    private let redView = UIView()
    
    private let orangeView = UIView()
    
    private let yellowView = UIView()
    
    private let greenView = UIView()
    
    private let blueView = UIView()
    
    private let purpleView = UIView()
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    func setStyle() {
        self.view.backgroundColor = .black
        self.navigationController?.isNavigationBarHidden = true

        redView.backgroundColor = .red
        orangeView.backgroundColor = .orange
        yellowView.backgroundColor = .yellow
        greenView.backgroundColor = UIColor(red: 0, green: 0.5, blue: 0, alpha: 1)
        blueView.backgroundColor = .blue
        purpleView.backgroundColor = .purple
    }
    
    func setHierarchy() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        [redView, orangeView, yellowView, greenView, blueView, purpleView].forEach {
            contentView.addSubview($0)
        }
    }
    
    func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView)
            $0.height.greaterThanOrEqualToSuperview().priority(.low)
        }
        
        redView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        orangeView.snp.makeConstraints {
            $0.top.equalTo(redView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        yellowView.snp.makeConstraints {
            $0.top.equalTo(orangeView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        greenView.snp.makeConstraints {
            $0.top.equalTo(yellowView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        blueView.snp.makeConstraints {
            $0.top.equalTo(greenView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        purpleView.snp.makeConstraints {
            $0.top.equalTo(blueView.snp.bottom)
            $0.bottom.equalTo(contentView)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(200)
        }

    }
    
    
}

