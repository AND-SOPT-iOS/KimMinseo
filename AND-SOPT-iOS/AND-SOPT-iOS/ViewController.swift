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
        let imageView = UIImageView()
        imageView.image = UIImage(named: "kakaoImage")
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "카카오톡"
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .black
        
        return label
    }()
    
    private lazy var openButton: UIButton = {
        let button = UIButton()
        button.setTitle("열기", for: .normal)
        button.backgroundColor = UIColor(red: 71/255, green: 123/255, blue: 255/255, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 15
        
        //버튼 타겟 설정
        button.addTarget(self, action: #selector(openButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    private let titleTextField: UITextField = {
        let textField = UITextField()
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
    
    private let contentTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "내용을 입력해주세요."
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
        let button = UIButton()
        button.setTitle("네비게이션 모드", for: .normal)
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
        
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    func setStyle() {
        self.view.backgroundColor = .white
    }
    
    func setHierarchy() {
        view.addSubviews(
            kakaoImageView,
            titleLabel,
            openButton,
            titleTextField,
            contentTextField,
            pushModeToggleButton
        )
    }
    
    func setLayout() {
        NSLayoutConstraint.activate([
            kakaoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 170),
            kakaoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            kakaoImageView.widthAnchor.constraint(equalToConstant: 100),
            kakaoImageView.heightAnchor.constraint(equalToConstant: 100),
            
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150),
            
            openButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            openButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150),
            openButton.widthAnchor.constraint(equalToConstant: 100),
            openButton.heightAnchor.constraint(equalToConstant: 30),
            
            titleTextField.topAnchor.constraint(equalTo: openButton.bottomAnchor, constant: 30),
            titleTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleTextField.widthAnchor.constraint(equalToConstant: 310),
            titleTextField.heightAnchor.constraint(equalToConstant: 50),
            
            contentTextField.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 10),
            contentTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contentTextField.widthAnchor.constraint(equalToConstant: 310),
            contentTextField.heightAnchor.constraint(equalToConstant: 50),
            
            pushModeToggleButton.topAnchor.constraint(equalTo: contentTextField.bottomAnchor, constant: 20),
            pushModeToggleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pushModeToggleButton.widthAnchor.constraint(equalToConstant: 310),
            pushModeToggleButton.heightAnchor.constraint(equalToConstant: 50)
        ])
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
        
        //if-let 구문으로 데이터 전달
        //텍스트 필드의 입력 값이 nil이 아니면 안에 구문 실행
        if let title = titleTextField.text, let content = contentTextField.text {
            nextViewController.dataBind(title: title, content: content)
        }
        guard let title = titleTextField.text, let content = contentTextField.text else {
            return
        }
        
        nextViewController.dataBind(title: title, content: content)

        if pushMode {
            self.navigationController?.pushViewController(nextViewController, animated: true)
        } else {
            self.present(nextViewController, animated: true)
        }
    }
}

