//
//  LogDataManager.swift
//  Plantity
//
//  Created by 김다연 on 2022/09/28.
//

import Foundation
import Alamofire

class LogDataManager{
    
    func plantCardDataManager(_ viewController: LogPageViewController) {
        AF.request(
            "http://plantity.shop/myplant/1",
            method: .get)
        .validate()
        .responseDecodable(
            of: LogUserPlantModel.self
        ){ response in
            switch response.result {
            case .success(let result):
                // 성공
                print("****LOG 나의식물 리스트 조회 성공 *****")
                //print(result)
                viewController.successGETAPI(result)
            case .failure(let error):
                // 실패
                print("***LOG 나의식물 리스트 조회 실패******")
                print(error.localizedDescription)
            }
        }
    }
    
    //put-LogRepotInput
    func LogRepotDataManager(_ assign: String,_ userId: Int,_ myPlantId: Int,_ viewController:MainPageViewController){
        
        AF.request("http://plantity.shop/myplant/\(assign)/\(userId)/\(myPlantId)",
                   method: .put)
            .validate()
            .responseDecodable(of: AssginDataModel.self) { response in

            /** 서버로부터 받은 데이터 활용 */
            switch response.result {
            case .success(let result):
                /** 정상적으로 reponse를 받은 경우 */
                print(result)
            case .failure(let error):
                /** 그렇지 않은 경우 */
                print(error.localizedDescription)
            }
        }
    }
}
