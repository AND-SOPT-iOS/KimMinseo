//
//  ChartCell.swift
//  AND-SOPT-iOS
//
//  Created by 김민서 on 10/26/24.
//

import UIKit

import Then
import SnapKit

final class ChartCell: UITableViewCell {
    
    // MARK: - UI Properties
    
    private let iconImageView: UIImageView = UIImageView()
    
    private let titleLabel: UILabel = UILabel()
    
    private let subTitleLabel: UILabel = UILabel()
    
    private let rankingLabel: UILabel = UILabel()
    
    private let verticalStackView: UIStackView = UIStackView()
    
    private let downloadButton: UIButton = UIButton()
    
    // MARK: - Properties
    
    static let identifier = "ChartCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setHierarchy()
        setLayout()
        setStyle()
    }


    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setHierarchy() {
        self.addSubviews(iconImageView, rankingLabel, verticalStackView, downloadButton)
        self.verticalStackView.addArrangedSubviews(titleLabel, subTitleLabel)
    }
    
    func setLayout() {
        iconImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.size.equalTo(80)
        }
        
        rankingLabel.snp.makeConstraints {
            $0.leading.equalTo(iconImageView.snp.trailing).offset(8)
            $0.top.equalToSuperview().offset(12)
        }
        
        verticalStackView.snp.makeConstraints {
            $0.leading.equalTo(rankingLabel.snp.trailing).offset(8)
            $0.trailing.equalTo(downloadButton.snp.leading).offset(-20)
            $0.top.equalToSuperview().inset(12)
            $0.bottom.greaterThanOrEqualToSuperview().inset(12)
        }
        
        downloadButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-20)
            $0.width.equalTo(70)
            $0.height.equalTo(30)
        }
    }
    
    func setStyle() {
        
        iconImageView.do {
            $0.layer.cornerRadius = 9
            $0.clipsToBounds = true
        }
        
        titleLabel.do {
            $0.numberOfLines = 2
        }
        
        subTitleLabel.do {
            $0.font = UIFont.systemFont(ofSize: 13)
            $0.textColor = .gray
        }
        verticalStackView.do {
            $0.axis = .vertical
            $0.alignment = .top
            $0.distribution = .equalSpacing
            $0.spacing = 4
        }
        
        downloadButton.do {
            $0.setTitleColor(.systemBlue, for: .normal)
            $0.backgroundColor = .lightgray
            $0.layer.cornerRadius = 15
            $0.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        }
    }
    
}

extension ChartCell {
    
    func configure(app: App) {
      iconImageView.image = app.iconImage
      rankingLabel.text = app.ranking.description
      titleLabel.text = app.title
      subTitleLabel.text = app.subTitle
      downloadButton.setTitle(app.downloadState.title, for: .normal)
    }
    
}



