//
//  NetworkService.swift
//  AND-SOPT-iOS
//
//  Created by 김민서 on 11/2/24.
//

import Alamofire
import UIKit

class NetworkService {
    
    func request<T: Decodable>(
        url: String,
        method: HTTPMethod,
        parameters: Encodable,
        completion: @escaping (Result<T, NetworkError>) -> Void
    ) {
        AF.request(url, method: method, parameters: parameters, encoder: JSONParameterEncoder.default)
            .validate()
            .response { response in
                switch response.result {
                case .success(let data):
                    guard let data = data else {
                        completion(.failure(.unknownError))
                        return
                    }
                    
                    do {
                        let decodedData = try JSONDecoder().decode(T.self, from: data)
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
    
    func decodeError(data: Data) -> String {
        guard let errorResponse = try? JSONDecoder().decode(ErrorResponse.self, from: data) else {
            return ""
        }
        return errorResponse.code
    }
}

