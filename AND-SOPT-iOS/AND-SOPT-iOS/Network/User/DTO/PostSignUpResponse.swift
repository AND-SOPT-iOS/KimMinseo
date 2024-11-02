//
//  PostSignUpResponse.swift
//  AND-SOPT-iOS
//
//  Created by 김민서 on 11/2/24.
//

import Foundation

struct PostSignUpResponse: Decodable {
    let result: ResultNum
}

struct ResultNum: Decodable {
    let no: Int
}
