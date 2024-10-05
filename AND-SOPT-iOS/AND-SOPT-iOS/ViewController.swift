//
//  ViewController.swift
//  AND-SOPT-iOS
//
//  Created by 김민서 on 10/5/24.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI Properties
    
    private let kakaoImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x:30, y:170, width:100, height:100))
        imageView.image = UIImage(named: "kakaoImage")
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x:150, y:200, width:236, height:44))
        label.text = "카카오톡"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .black
        
        return label
    }()
    
    private lazy var openButton: UIButton = {
        let button = UIButton(frame: CGRect(x:150, y:240, width:100, height:30))
        button.setTitle("열기", for: .normal)
        button.backgroundColor = UIColor(red: 71/255, green: 123/255, blue: 255/255, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 15
        
        //버튼 타겟 설정
        button.addTarget(self, action: #selector(openButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    private let titleTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x:30, y:290, width:310, height:50))
        textField.placeholder = "제목을 입력해주세요."
        textField.clearButtonMode = .whileEditing
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 7
        
        //padding
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        return textField
    }()
    
    private lazy var pushModeToggleButton: UIButton = {
        let button = UIButton(frame: CGRect(x:30, y:350, width:310, height:50))
        button.setTitle("전환 모드 변경", for: .normal)
        button.backgroundColor = UIColor(red: 71/255, green: 123/255, blue: 255/255, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 7
        
        //화면 전한 방식을 전환해주는 버튼 타겟 설정
        button.addTarget(self, action: #selector(toggleButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    
    // MARK: - Properties
    
    private var pushMode: Bool = false
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        [
            kakaoImageView,
            titleLabel,
            openButton,
            titleTextField,
            pushModeToggleButton
        ].forEach {
            self.view.addSubview($0)
        }
    }
    
    
}

extension ViewController {
    
    //버튼 타겟 메서드
    @objc
    func openButtonTapped() {
        transitionToNextViewController()
    }
    
    //버튼 클릭 시 어떤 화면 전환 방식인지 텍스트 변경해주는 메서드
    @objc
    func toggleButtonTapped() {
        //버튼 클릭 식 toggle로 Bool 값을 변경
        self.pushMode.toggle()
        
        if pushMode {
            self.pushModeToggleButton.setTitle("네비게이션 모드", for: .normal)
        } else {
            self.pushModeToggleButton.setTitle("모달 모드", for: .normal)
        }
    }
    
    //화면 전환
    private func transitionToNextViewController() {
        let nextViewController = DetailViewController()
        
        if pushMode {
            self.navigationController?.pushViewController(nextViewController, animated: true)
        } else {
            self.present(nextViewController, animated: true)
        }
    }
    
    
}

