//
//  AddDataManager.swift
//  Plantity
//
//  Created by 최은형 on 2022/09/01.
//

import Foundation
import Alamofire

class AddDataManager {
    
    func addDataManager(_ parameter: AddDataInput, _ viewController: AddPlantViewController) {
        AF.request("http://plantity.shop/myplant/save", method: .post, parameters: parameter, encoder: JSONParameterEncoder.default, headers: nil)
        .validate()
        .responseDecodable(of: AddDataModel.self) { response in
            switch response.result {
            case .success(let result):
                if result.success {
                    // 성공
                } else {
                    // 실패
                    print(result.msg)
                }
            case .failure(let error):
                print(error.localizedDescription)
                }
            }
        }
}
