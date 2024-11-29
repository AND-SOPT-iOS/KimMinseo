//
//  HobbyService.swift
//  AND-SOPT-iOS
//
//  Created by 김민서 on 11/7/24.
//

import Alamofire
import Foundation

class HobbyService {
    
    // 유저의 취미 정보를 가져오는 메서드
    func getUserHobby(token: String, completion: @escaping (Result<GetMyHobbyResponse, NetworkError>) -> Void) {
        
        guard let token = UserDefaultsHelper.token else {
            completion(.failure(.unknownError)) // 토큰이 없으면 에러 처리
            return
        }
        
        let url = Environment.baseURL + "/user/my-hobby"
        
        // HTTP 헤더에 토큰을 설정
        let headers: HTTPHeaders = [
            "token": "\(token)"
        ]
   
        print("✅",headers)
        
        // GET 요청 보내기
        AF.request(url, method: .get, headers: headers)
            .validate()
            .response { response in
                switch response.result {
                case .success(let data):
                    guard let data = data else {
                        completion(.failure(.unknownError))
                        return
                    }
                    
                    // 응답 데이터가 성공적으로 왔을 때
                    do {
                        let decodedData = try JSONDecoder().decode(GetMyHobbyResponse.self, from: data)
                        completion(.success(decodedData))
                    } catch {
                        print("Decoding error: \(error.localizedDescription)")
                        completion(.failure(.decodingError))
                    }
                    
                case .failure:
                    // 실패한 경우 (status code를 확인하고 에러를 처리)
                    if let statusCode = response.response?.statusCode, let data = response.data {
                        let error = self.handleStatusCode(statusCode, data: data)
                        completion(.failure(error))
                    } else {
                        completion(.failure(.unknownError))
                    }
                }
            }
    }
    
    
    func getHobby(userNo: Int, completion: @escaping (Result<GetHobbyResponse, NetworkError>) -> Void) {
        
        let url = "\(Environment.baseURL)/user/\(userNo)/hobby"
        
        AF.request(url, method: .get)
            .validate()
            .response { response in
                switch response.result {
                case .success(let data):
                    guard let data = data else {
                        completion(.failure(.unknownError))
                        return
                    }
                    
                    do {
                        // 응답 데이터 디코딩
                        let decodedData = try JSONDecoder().decode(GetHobbyResponse.self, from: data)
                        completion(.success(decodedData))
                    } catch {
                        print("Decoding Error: \(error.localizedDescription)")
                        completion(.failure(.decodingError))
                    }
                    
                case .failure:
                    if let statusCode = response.response?.statusCode, let data = response.data {
                        let error = self.handleStatusCode(statusCode, data: data)
                        completion(.failure(error))
                    } else {
                        completion(.failure(.unknownError))
                    }
                }
            }
    }
    
    func decodeError(data: Data) -> String {
        guard let errorResponse = try? JSONDecoder().decode(ErrorResponse.self, from: data) else {
            return ""
        }
        return errorResponse.code
    }
    
    func handleStatusCode(_ statusCode: Int, data: Data) -> NetworkError {
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
    
}
