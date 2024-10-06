//
//  DetailViewController.swift
//  AND-SOPT-iOS
//
//  Created by 김민서 on 10/5/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - UI Properties
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("이전 화면으로", for: .normal)
        button.backgroundColor = UIColor(red: 71/255, green: 123/255, blue: 255/255, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 7
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    private func setStyle() {
        self.view.backgroundColor = .white
    }
    
    private func setHierarchy() {
        [titleLabel, contentLabel, backButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
    }
    
    private func setLayout() {
        NSLayoutConstraint.activate(
            [
                titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
                titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                contentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
                contentLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                backButton.topAnchor.constraint(equalTo: contentLabel.bottomAnchor,constant: 10),
                backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                backButton.heightAnchor.constraint(equalToConstant: 50),
                backButton.widthAnchor.constraint(equalToConstant: 310),
            ]
        )
    }
    
    func dataBind(title: String, content: String) {
        self.titleLabel.text = title
        self.contentLabel.text = content
    }
    
    @objc func backButtonTapped() {
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
}


