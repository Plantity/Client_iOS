//
//  SearchDataManager.swift
//  Plantity
//
//  Created by 최은형 on 2022/08/17.
//

import Foundation
import Alamofire

class SearchDataManager {
    func searchDataManager(_ parameters: SearchDataInput, _ viewController: SearchViewController) {
        // 데이터 주고받는 함수
        AF.request(
            "http://plantity.shop/plant",
            method: .get,
            parameters: parameters)
        .validate()
        .responseDecodable(
            of: SearchDataModel.self
        ) { response in
            print(response)
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
    
    func selectorDataManager(_ parameters: SearchDataInput, _ viewController: TypeSelectorViewController) {
        // 식물추가할때 데이터 주고받는 함수
        AF.request(
            "http://plantity.shop/plant",
            method: .get,
            parameters: parameters)
        .validate()
        .responseDecodable(
            of: SearchDataModel.self
        ) { response in
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
    
    func detailDataManager(_ cntntsNo: String, _ viewController: PlantViewController) {
        // 식물상세조회 시 데이터 주고받는 함수
        AF.request(
            "http://plantity.shop/plant/\(cntntsNo)",
            method: .get)
        .validate()
        .responseDecodable(
            of: DetailDataModel.self
        ) { response in
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
