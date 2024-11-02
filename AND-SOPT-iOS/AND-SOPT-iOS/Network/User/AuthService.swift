//
//  AuthService.swift
//  AND-SOPT-iOS
//
//  Created by 김민서 on 11/2/24.
//

import Alamofire
import UIKit

class AuthService {
    
    func register(
        username: String,
        password: String,
        completion: @escaping (Result<Bool, NetworkError>) -> Void
    ) {
        
        let url = Environment.baseURL + "/login"
        let parameters = PostUserInfoRequest(
            username: username,
            password: password
        )
        
        AF.request(
            url,
            method: .post,
            parameters: parameters,
            encoder: JSONParameterEncoder.default
        )
        .validate()
        .response { [weak self] response in
            if let data = response.data {
                print("Response Data: \(String(data: data, encoding: .utf8) ?? "No Data")")
                do {
                    let jsonResponse = try JSONDecoder().decode(PostUserInfoResponse.self, from: data)
                    let token = jsonResponse.result.token
                    self?.saveToken(token)
                } catch {
                    print("Decoding Error: \(error.localizedDescription)")
                    completion(.failure(.decodingError))
                }
            } else {
                completion(.failure(.unknownError))
            }
        }
    }
    
    func handleStatusCode(
        _ statusCode: Int,
        data: Data
    ) -> NetworkError {
        let errorCode = decodeError(data: data)
        switch (statusCode, errorCode) {
        case (400, "01"):
            return .expressionError
        case (400, "02"):
            return .invalidRequest
        case (403, "01"):
            return .invalidRequest
        case (403, "00"):
            return .invalidURL
        case (500, ""):
            return .serverError
        default:
            return .unknownError
        }
    }
    
    func decodeError(data: Data) -> String {
        guard let errorResponse = try? JSONDecoder().decode(
            ErrorResponse.self,
            from: data
        ) else { return "" }
        return errorResponse.code
    }
}



extension AuthService {
    
    //UserDefault에 토큰 저장
    func saveToken(_ token: String) {
        UserDefaults.standard.set(token, forKey: "userToken")
    }
    
}
