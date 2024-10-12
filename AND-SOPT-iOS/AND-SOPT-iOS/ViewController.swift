//
//  ViewController.swift
//  AND-SOPT-iOS
//
//  Created by 김민서 on 10/5/24.
//

import UIKit

import SnapKit
import Then

class ViewController: UIViewController {
    
    // MARK: - UI Properties
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "kakaoImage")
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "안녕 나 치이카와~!"
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
    
    weak var delegate: DataBindDelegate?

    
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
            iconImageView,
            titleLabel,
            openButton,
            titleTextField,
            contentTextField,
            pushModeToggleButton
        )
    }
    
    func setLayout() {
        
        iconImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
            $0.leading.equalToSuperview().inset(20)
            $0.size.equalTo(100)
        }
        
        titleLabel.snp.makeConstraints {
            $0.bottom.equalTo(openButton.snp.top).offset(-10)
            $0.leading.equalTo(openButton)
        }
        
        openButton.snp.makeConstraints {
            $0.bottom.equalTo(iconImageView)
            $0.leading.equalTo(iconImageView.snp.trailing).offset(10)
            $0.width.equalTo(100)
            $0.height.equalTo(30)
        }
        
        titleTextField.snp.makeConstraints {
            $0.top.equalTo(iconImageView.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        contentTextField.snp.makeConstraints {
            $0.top.equalTo(titleTextField.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        pushModeToggleButton.snp.makeConstraints {
            $0.top.equalTo(contentTextField.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
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
    
    private func transitionToNextViewController() {
        let nextViewController = DetailViewController()
        
        // 데이터 전달
        if let title = titleTextField.text, let content = contentTextField.text {
            nextViewController.dataBind(title: title, content: content)
        }
        
        // delegate 설정
        nextViewController.delegate = self
        
        // 화면 전환
        if pushMode {
            self.navigationController?.pushViewController(nextViewController, animated: true)
        } else {
            self.present(nextViewController, animated: true)
        }
    }

}

extension ViewController: DataBindDelegate {
    
    func dataBind(content: String) {
        self.titleLabel.text = "전달 완! \(content)"
  }
    
}

