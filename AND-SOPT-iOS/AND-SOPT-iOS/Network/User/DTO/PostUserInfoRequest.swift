//
//  postUserInfoRequest.swift
//  AND-SOPT-iOS
//
//  Created by 김민서 on 11/2/24.
//

import Foundation

struct PostUserInfoRequest: Codable {
  let username: String
  let password: String
}