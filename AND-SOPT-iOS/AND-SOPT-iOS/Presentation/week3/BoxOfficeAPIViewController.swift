//
//  BoxOfficeAPIViewController.swift
//  AND-SOPT-iOS
//
//  Created by 김민서 on 10/31/24.
//

import UIKit

class BoxOfficeAPIViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 원하는 날짜로 API 호출
        fetchBoxOfficeData(for: "20120101") // 날짜를 원하는 대로 변경 가능
        self.view.backgroundColor = .red
    }
    
    func fetchBoxOfficeData(for targetDate: String) {
        let boxOfficeAPI = BoxOfficeAPI()
        boxOfficeAPI.fetchBoxOffice(for: targetDate) { jsonResponse in
            // JSON 파싱
            guard let boxOfficeResult = jsonResponse?["boxOfficeResult"] as? [String: Any],
                  let dailyBoxOfficeList = boxOfficeResult["dailyBoxOfficeList"] as? [[String: Any]] else {
                print("Data parsing error")
                return
            }

            // 응답 데이터 출력
            for box in dailyBoxOfficeList {
                if let movieTitle = box["movieNm"] as? String,
                   let rank = box["rank"] as? String,
                   let audiAcc = box["audiAcc"] as? String {
                    print("영화 제목: \(movieTitle), 순위: \(rank), 누적 관객 수: \(audiAcc)")
                }
            }
        }
    }


}

