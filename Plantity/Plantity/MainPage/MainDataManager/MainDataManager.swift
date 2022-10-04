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
    
    // 내 카드 조회하기1
    //get-plantcard
    func plantDataManager(_ parameters: UserPlantInput, _ viewController:MainPageViewController){
        AF.request("", method: .get,
                   parameters: parameters ).validate().responseDecodable(of: [UserPlant].self) { response in
            switch response.result{
            case.success(let result):
                print("성공")
//                print(response)
                viewController.successplantAPI(result)
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    
    //--------------------------
    
    // 내 카드 조회하기2
    func getplantcardTest() {
            let url = "https://jsonplaceholder.typicode.com/todos/1"
            AF.request(url,
                       method: .get,
                       parameters: nil,
                       encoding: URLEncoding.default,
                       headers: ["Content-Type":"application/json", "Accept":"application/json"])
                .validate(statusCode: 200..<300)
                .responseJSON { response in
                
//                    print(response)
                    switch response.result{
                    case.success(let value):
                        print("value")
                        print(value)
                        //받은 데이터 출력
                        if let jsonObj=value as? [String:Any?]{
//                            print("데이터의 갯수:\(jsonObj.count)")
                            if let userId=jsonObj["id"]{
                                print("userId=\(userId)")
                            }
                            if let id=jsonObj["id"]{
                                print("id=\(id)")
                            }
                        }
                    case.failure(let error):
                        print("error: \(String(describing: error.errorDescription))")
                    }
                    
            }
        }
    
    //--------------------------
    
    //put-LogRepotInput
    func MainAssignDataManager(_ assign: String,_ userId: Int,_ myPlantId: Int,_ viewController:MainPageViewController){
        
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
    
    
    //post --> post이 아니라 put 인듯 -> 삭제해도 될듯
    func posts(_ parameters: TodoInput, _ viewController:MainPageViewController){
        AF.request("http://plantity.shop/myplant/repot/{userId}/{myPlantId}", method: .post, parameters: parameters, encoder: JSONParameterEncoder.default,headers: nil).validate().responseDecodable(of:TodoRepotDataModel.self) { response in
            switch response.result{
            case.success(let result):
                if result.isSuccess{
                    print("성공")
                }else{
                    print("result.message")
                }
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

