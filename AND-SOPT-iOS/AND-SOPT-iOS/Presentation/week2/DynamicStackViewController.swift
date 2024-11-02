//
//  DynamicStackViewController.swift
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
    
    private let lineView2: UIView = UIView()
    
    private let tagLabel: UILabel = UILabel()

    private let tagListStackView: UIStackView = UIStackView()
    
    // MARK: - UI Properties
    
    private let colorArray: [UIColor] = [
        .lightgray, .lightblue, .lightpink, .lightgreen1, .lightgreen2, .lightyellow, .lightcoral
    ]
    
    let tagTexts: [String] = [
        "위아요짱", "아요를 위아요~", "뷰짜자고?", "너 누군데?", "UIStackView", "술이나 마시자", "홈리스클럽", "하암"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setHierarchy()
        setLayout()
        setStyle()
        setupTagList()
    }
    
    func setHierarchy() {
        self.view.addSubviews(titleLabel, lineView, scrollView, lineView2, tagLabel, tagListStackView)
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
        
        lineView2.snp.makeConstraints {
            $0.top.equalTo(stackView.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(35)
        }
        
        tagLabel.snp.makeConstraints {
            $0.bottom.equalTo(lineView2).inset(3)
            $0.leading.equalToSuperview().inset(16)
        }
        
        tagListStackView.snp.makeConstraints {
            $0.top.equalTo(lineView2.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(16)
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
        
        lineView2.do {
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
            $0.distribution = .fill
        }
        
        tagLabel.do {
            $0.text = "태그 선택"
            $0.textColor = .darkgray
            $0.font = .systemFont(ofSize: 13)
        }
        
        tagListStackView.do {
            $0.axis = .vertical
            $0.spacing = 5
            $0.alignment = .leading
            $0.distribution = .fill
        }
    }
    
    
    @objc
    func tagButtonTapped(_ sender: UIButton) {
        guard let tagText = sender.title(for: .normal),
              let backgroundColor = sender.backgroundColor else { return }
        
        addTagToStack(tagText: tagText, backgroundColor: backgroundColor)
    }
    
    @objc
    func deleteTag(_ sender: UIButton) {
        if let tagButton = sender.superview as? UIButton {
            tagButton.removeFromSuperview()
        }
    }
}

extension DynamicStackViewController {
    
    func setupTagList() {
        for (index, tagText) in tagTexts.enumerated() {
            let tagButton: UIButton = UIButton()
            let backgroundColor = colorArray[index % colorArray.count]
            
            tagButton.do {
                $0.setTitle(tagText, for: .normal)
                $0.backgroundColor = backgroundColor
                $0.setTitleColor(darkerColor(for: backgroundColor), for: .normal)
                $0.layer.cornerRadius = 3
                $0.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
                $0.titleLabel?.font = UIFont.systemFont(ofSize: 16)
                $0.addTarget(self, action: #selector(tagButtonTapped(_:)), for: .touchUpInside)
            }
            
            tagButton.snp.makeConstraints {
                $0.height.equalTo(30)
            }
            
            tagListStackView.addArrangedSubview(tagButton)
        }
    }
    
    func addTagToStack(tagText: String, backgroundColor: UIColor) {
        let newTag = createTagButton(tagText: tagText, backgroundColor: backgroundColor)
        configureDeleteButton(for: newTag)
        
        stackView.addArrangedSubview(newTag)
    }
    
    func createTagButton(tagText: String, backgroundColor: UIColor) -> UIButton {
        let tagButton = UIButton()
        tagButton.do {
            $0.setTitle(tagText, for: .normal)
            $0.backgroundColor = backgroundColor
            $0.setTitleColor(darkerColor(for: backgroundColor), for: .normal)
            $0.layer.cornerRadius = 3
            $0.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 30)
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        }
        return tagButton
    }

    func configureDeleteButton(for tagButton: UIButton) {
        let deleteButton = UIButton(type: .custom)
        
        if let closeIcon = UIImage(named: "closeIcon")?.withRenderingMode(.alwaysTemplate) {
            deleteButton.setImage(closeIcon, for: .normal)
        }
        
        deleteButton.do {
            $0.tintColor = darkerColor(for: tagButton.backgroundColor!)
            $0.addTarget(self, action: #selector(deleteTag(_:)), for: .touchUpInside)
        }
        
        tagButton.addSubview(deleteButton)
        
        deleteButton.snp.makeConstraints {
            $0.width.height.equalTo(10)
            $0.trailing.equalToSuperview().offset(-10)
            $0.centerY.equalToSuperview()
        }
    }
    
    func darkerColor(for color: UIColor) -> UIColor {
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
