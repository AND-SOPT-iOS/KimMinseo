//
//  getUserInfoResponse.swift
//  AND-SOPT-iOS
//
//  Created by 김민서 on 11/2/24.
//

import Foundation

struct GetTokenResponse: Decodable {
    let result: ResultData
}

struct ResultData: Decodable {
    let token: String
}

