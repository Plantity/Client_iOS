//
//  MainDataManager.swift
//  Plantity
//
//  Created by 김다연 on 2022/09/09.
//
import Foundation
import Alamofire

class MainDataManager{
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
    
    //get-plantcard
    func plantDataManager(_ parameters: UserPlantInput, _ viewController:MainPageViewController){
        AF.request("", method: .get, parameters: parameters ).validate().responseDecodable(of: [UserPlant].self) { response in
            switch response.result{
            case.success(let result):
                print("성공")
                viewController.successplantAPI(result)
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    //post
    func posts(_ parameters: TodoInput, _ viewController:MainPageViewController){
        
        AF.request("", method: .post, parameters: parameters, encoder: JSONParameterEncoder.default,headers: nil).validate().responseDecodable(of:Todo.self) { response in
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

