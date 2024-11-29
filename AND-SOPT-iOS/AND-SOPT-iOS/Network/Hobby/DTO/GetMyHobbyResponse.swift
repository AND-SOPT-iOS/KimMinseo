//
//  GetHobbyResponse.swift
//  AND-SOPT-iOS
//
//  Created by 김민서 on 11/7/24.
//

import Foundation

struct GetMyHobbyResponse: Decodable {
    let result: MyHobbyResult?
    
    struct MyHobbyResult: Decodable {
        let hobby: String
    }
}

