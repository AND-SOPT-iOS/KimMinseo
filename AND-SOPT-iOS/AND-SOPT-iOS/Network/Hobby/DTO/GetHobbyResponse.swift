//
//  GetHobbyResponse.swift
//  AND-SOPT-iOS
//
//  Created by 김민서 on 11/7/24.
//

import Foundation

struct GetHobbyResponse: Decodable {
    let result: HobbyResult?
    
    struct HobbyResult: Decodable {
        let hobby: String
    }
}
