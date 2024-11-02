//
//  BoxOfficeAPI.swift
//  AND-SOPT-iOS
//
//  Created by 김민서 on 10/31/24.
//

//
//  BoxOfficeAPI.swift
//  AND-SOPT-iOS
//
//  Created by 김민서 on 10/31/24.
//

//
//  BoxOfficeAPI.swift
//  AND-SOPT-iOS
//
//  Created by 김민서 on 10/31/24.
//

import UIKit
import Moya

// 1️⃣ API 정의
enum BoxOfficeService {
    case getBoxOffice(targetDate: String)
}

// 2️⃣ Moya의 Target 프로토콜 구현
extension BoxOfficeService: TargetType {
    var baseURL: URL {
        return URL(string: "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice")!
    }
    
    var path: String {
        switch self {
        case .getBoxOffice:
            return "/searchDailyBoxOfficeList.json"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        switch self {
        case .getBoxOffice(let targetDate):
            return .requestParameters(parameters: ["key": "727bb3a7287af4fed4dbdd132caad537", "targetDt": targetDate], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String: String]? {
        return nil
    }

}

// 3️⃣ BoxOfficeAPI 클래스 구현
class BoxOfficeAPI {
    private let provider = MoyaProvider<BoxOfficeService>()
    
    func fetchBoxOffice(for targetDate: String, completion: @escaping ([String: Any]?) -> Void) {
        provider.request(.getBoxOffice(targetDate: targetDate)) { result in
            switch result {
            case .success(let response):
                do {
                    let jsonResponse = try response.mapJSON() as? [String: Any]
                    completion(jsonResponse)
                } catch {
                    print("JSON parsing error: \(error)")
                    completion(nil)
                }
                
            case .failure(let error):
                print("Error occurred: \(error)")
                completion(nil)
            }
        }
    }
}
