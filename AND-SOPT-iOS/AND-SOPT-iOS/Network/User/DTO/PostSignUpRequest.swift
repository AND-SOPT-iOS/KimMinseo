//
//  PostSignUpRequest.swift
//  AND-SOPT-iOS
//
//  Created by 김민서 on 11/2/24.
//

import Foundation

struct PostSignUpRequest: Codable {
    let username: String
    let password: String
    let hobby: String
}
