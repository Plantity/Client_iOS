//
//  SearchDataManager.swift
//  Plantity
//
//  Created by 최은형 on 2022/08/17.
//

import Foundation
import Alamofire

class SearchDataManager {
    func feedDataManager(_ parameters: SearchDataInput, _ viewController: SearchViewController) {
        // 데이터 주고받는 함수
        AF.request("https://api.thecatapi.com/v1/images/search", method: .get, parameters: parameters).validate().responseDecodable(of: SearchDataModel.self) { response in
            switch response.result {
            case .success(let result):
                // 성공
                viewController.successAPI(result)
            case .failure(let error):
                // 실패
                print(error.localizedDescription)
            }
        }
    }
}
