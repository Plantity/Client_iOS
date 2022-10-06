//
//  MainDataManager.swift
//  Plantity
//
//  Created by 김다연 on 2022/09/09.
//
import Foundation
import Alamofire

class MainDataManager{
    //유저정보 가져오기
    //get-userinfo
    func maininfoDataManager(_ parameters: UserInfoInput, _ viewController:MainPageViewController){
        AF.request("", method: .get, parameters: parameters ).validate().responseDecodable(of: [UserInfo].self) { response in
            switch response.result{
            case.success(let result):
                print("성공")
                viewController.successuserAPI(result)
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    

    
    //--------------------------
    
    func plantCardDataManager(_ viewController: MainPageViewController) {
        AF.request(
            "http://httpstat.us/200",
            method: .get)
        .validate()
        .responseDecodable(
            of: UserPlantModel.self
        ){ response in
            switch response.result {
            case .success(let result):
                // 성공
                print("*********")
                print(result)
                viewController.successAPI(result)
            case .failure(let error):
                // 실패
                print("***실패******")
                print(error.localizedDescription)
            }
        }
    }
    

    
    //--------------------------
    
    // 우리 url
    // "http://plantity.shop/myplant/\(assign)/\(userId)/\(myPlantId)"
    
    // test url
    // https://jsonplaceholder.typicode.com/posts/1
    
    //put-LogRepotInput
    func MainAssignDataManager(_ assign: String,_ userId: Int,_ myPlantId: Int,_ viewController:MainPageViewController){
        
        AF.request("https://jsonplaceholder.typicode.com/posts/1",
                   method: .put)
            .validate()
            .responseDecodable(of: MainAssginDataModel.self) { response in

            /** 서버로부터 받은 데이터 활용 */
            switch response.result {
            case .success(let result):
                /** 정상적으로 reponse를 받은 경우 */
                print("=======성공=====")
                print(result)
            case .failure(let error):
                /** 그렇지 않은 경우 */
                print("=======실패=====")
                print(error.localizedDescription)
            }
        }
    }

}

