//
//  MyDataManager.swift
//  Plantity
//
//  Created by 최은형 on 2022/08/15.
//

import Foundation
import Alamofire

class MyDataManager {
    func myDataManager(_ userId: Int, _ viewController: MyPageViewController) {
        // 데이터 주고받는 함수
        AF.request("http://plantity.shop/users/\(userId)", method: .get)
            .validate()
            .responseDecodable(of: MyDataModel.self) { response in
            switch response.result {
            case .success(let result):
                // 성공
                viewController.successAPI(result)
            case .failure(let error):
                // 실패
                print(error)
            }
        }
    }
}
