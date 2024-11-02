//
//  App.swift
//  AND-SOPT-iOS
//
//  Created by 김민서 on 10/26/24.
//

import UIKit

struct App {
    let iconImage: UIImage?
    let ranking: Int
    let title: String
    let subTitle: String
    let downloadState: DownloadState
}

enum DownloadState {
    case downloaded
    case notDownloaded
    
    var title: String {
        switch self {
        case .downloaded:
            return "열기"
        case .notDownloaded:
            return "받기"
        }
    }
}

