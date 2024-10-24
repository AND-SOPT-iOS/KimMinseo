//
//  MainViewController.swift
//  AND-SOPT-iOS
//
//  Created by 김민서 on 10/22/24.
//

import UIKit

import SnapKit
import Then

class DynamicStackViewController: UIViewController {
    
    // MARK: - UI Properties
    
    private let titleLabel: UILabel = UILabel()
    
    private let lineView: UIView = UIView()
    
    private let scrollView: UIScrollView = UIScrollView()
    
    private let stackView: UIStackView = UIStackView()
    
    private let addButton: UIButton = UIButton()
    
    // MARK: - UI Properties
    
    private let colorArray: [UIColor] = [
        .lightgray, .lightblue, .lightpink, .lightgreen1, .lightgreen2, .lightyellow, .lightcoral
    ]
    
    let tagTexts: [String] = [
        "위아요짱", "아요를 위아요~", "뷰짜자고?", "너 누군데?", "UIStackView", "술이나 마시자", "홈리스클럽", "하암"
    ]
    
    private var currentTagIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHierarchy()
        setLayout()
        setStyle()
    }
    
    func setHierarchy() {
        self.view.addSubviews(titleLabel, lineView, scrollView, addButton)
        scrollView.addSubview(stackView)
    }
    
    func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(60)
            $0.centerX.equalToSuperview()
        }
        
        lineView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(2)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(lineView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(30)
        }
        
        stackView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(scrollView.snp.leading).offset(16)
            $0.trailing.equalTo(scrollView.snp.trailing).offset(-16)
            $0.height.equalTo(30)
        }
        
        addButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
        }
        
    }
    
    func setStyle() {
        view.backgroundColor = .white
        
        titleLabel.do {
            $0.text = "태그"
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 17)
        }
        
        lineView.do {
            $0.backgroundColor = .lightgray
        }
        
        scrollView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.showsHorizontalScrollIndicator = false
            $0.alwaysBounceHorizontal = true
        }
        
        stackView.do {
            $0.axis = .horizontal
            $0.spacing = 10
            $0.alignment = .fill
            $0.distribution = .fill // 각 버튼이 콘텐츠에 맞춰 크기 조정
        }
        
        addButton.do {
            $0.setTitle("태그 추가하기", for: .normal)
            $0.setTitleColor(.blue, for: .normal)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        }
        
    }
    
    @objc private func addButtonTapped() {
        guard currentTagIndex < tagTexts.count else { return } // 모든 태그가 추가되면 리턴
        
        let newTag: UIButton = UIButton()
        
        let backgroundColor = colorArray.randomElement() ?? .lightGray // 색상 배열에서 무작위 색상 선택
        newTag.do {
            $0.setTitle(tagTexts[currentTagIndex], for: .normal)
            $0.backgroundColor = backgroundColor // 배경색 설정
            $0.setTitleColor(darkerColor(for: backgroundColor), for: .normal) // 진한 색상으로 설정
            $0.layer.cornerRadius = 3
            $0.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 30) // 패딩 설정
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 16) // 폰트 설정
            
            // X 아이콘 추가
            let deleteButton = UIButton(type: .custom)
            if let closeIcon = UIImage(named: "closeIcon")?.withRenderingMode(.alwaysTemplate) {
                deleteButton.setImage(closeIcon, for: .normal)
            }
            deleteButton.tintColor = darkerColor(for: newTag.backgroundColor!) // 아이콘 색상
            deleteButton.addTarget(self, action: #selector(deleteTag(_:)), for: .touchUpInside) // 삭제 메서드 연결
            
            // 태그 버튼에 X 아이콘 추가
            newTag.addSubview(deleteButton)
            
            // X 아이콘 제약조건 설정
            deleteButton.snp.makeConstraints {
                $0.width.height.equalTo(10) // 아이콘 크기 설정
                $0.trailing.equalToSuperview().offset(-10) // 태그 버튼 오른쪽에 위치
                $0.centerY.equalToSuperview() // 중앙 정렬
            }
        }
        
        newTag.snp.makeConstraints {
            $0.height.equalTo(30)
        }
        
        stackView.addArrangedSubview(newTag)
        
        currentTagIndex += 1 // 인덱스 증가
    }
    
    @objc private func deleteTag(_ sender: UIButton) {
        if let tagButton = sender.superview as? UIButton {
            tagButton.removeFromSuperview() // 해당 태그 버튼 삭제
        }
    }
}

extension DynamicStackViewController {
    
    private func darkerColor(for color: UIColor) -> UIColor {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return UIColor(red: max(red - 0.5, 0),
                       green: max(green - 0.5, 0),
                       blue: max(blue - 0.5, 0),
                       alpha: alpha)
    }
}
