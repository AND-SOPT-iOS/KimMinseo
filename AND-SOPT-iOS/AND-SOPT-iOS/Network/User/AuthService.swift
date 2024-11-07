//
//  AuthService.swift
//  AND-SOPT-iOS
//
//  Created by 김민서 on 11/2/24.
//

import Alamofire
import UIKit

class AuthService: NetworkService {
    
    func postUserInfo(username: String, password: String, completion: @escaping (Result<String, NetworkError>) -> Void) {
        let url = Environment.baseURL + "/login"
        let parameters = PostUserInfoRequest(username: username, password: password)
        
        request(url: url, method: .post, parameters: parameters) { (result: Result<PostUserInfoResponse, NetworkError>) in
            switch result {
            case .success(let response):
                let token = response.result.token
                self.saveToken(token)
                completion(.success(token)) // 토큰을 성공 결과로 반환
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
}



extension AuthService {
    
    //UserDefault에 토큰 저장
    func saveToken(_ token: String) {
        UserDefaults.standard.set(token, forKey: "userToken")
    }
    
}
