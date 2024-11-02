//
//  ChartViewController.swift
//  AND-SOPT-iOS
//
//  Created by 김민서 on 10/26/24.
//


import UIKit

import SnapKit
import Then

class ChartViewController: UIViewController {
    
    // MARK: - UI Properties
    
    private let tableView: UITableView = UITableView(frame: .zero, style: .plain)
    
    // MARK: - Properties
    
    private let appList: [App] = [
        App(iconImage: UIImage(named: "image1"), ranking: 1, title: "네이버 카페 - Naver Cafe", subTitle: "소셜 네트워킹", downloadState: .notDownloaded),
        App(iconImage: UIImage(named: "image1"), ranking: 2, title: "SOPT", subTitle: "소셜 네트워킹", downloadState: .downloaded),
    ]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setHierarchy()
        setLayout()
        setDelegate()
        registerCell()
    }
    
    func setStyle() {
        tableView.do {
            $0.rowHeight = 250
        }
    }
    
    func setHierarchy() {
        self.view.addSubview(tableView)
    }
    
    func setLayout() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func registerCell() {
        tableView.register(ChartCell.self, forCellReuseIdentifier: ChartCell.identifier)
    }
    
}


extension ChartViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}


extension ChartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appList.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ChartCell.identifier,
            for: indexPath
        ) as? ChartCell else { return UITableViewCell() }
        cell.configure(app: appList[indexPath.row])
        return cell
    }
}
