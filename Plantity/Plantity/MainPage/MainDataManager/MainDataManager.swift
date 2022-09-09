//
//  MainDataManager.swift
//  Plantity
//
//  Created by 김다연 on 2022/09/09.
//
import Foundation
import Alamofire

class MainDataManager{
    //get
    func maininfoDataManager(_ parameters: UserInfoInput, _ viewController:MainPageViewController){
        AF.request("", method: .get, parameters: parameters ).validate().responseDecodable(of: [UserInfo].self) { response in
            switch response.result{
            case.success(let result):
                print("성공")
                viewController.successAPI(result)
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    //post
    func mainplantDataManager(_ parameters: TodoInput, _ viewController:MainPageViewController){
        AF.request("", method: .post, parameters: parameters ).validate().responseDecodable(of: [UserInfo].self) { response in
            switch response.result{
            case.success(let result):
                print("성공")
                viewController.successAPI(result)
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

