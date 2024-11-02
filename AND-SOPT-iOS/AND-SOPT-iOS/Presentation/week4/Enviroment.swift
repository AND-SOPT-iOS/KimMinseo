//
//  Enviroment.swift
//  AND-SOPT-iOS
//
//  Created by 김민서 on 11/2/24.
//

import Foundation

enum Environment {
  static let baseURL: String = Bundle.main.infoDictionary?["BASE_URL"] as! String
}
