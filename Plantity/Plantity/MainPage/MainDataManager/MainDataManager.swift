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
    // - 이름
    // - 게이지
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
    

    
    //-----------------------나의식물 리스트 조회--------------
    
    func plantCardDataManager(_ viewController: MainPageViewController) {
        AF.request(
            "http://plantity.shop/myplant/1",
            method: .get)
        .validate()
        .responseDecodable(
            of: UserPlantModel.self
        ){ response in
            switch response.result {
            case .success(let result):
                // 성공
                print("****나의식물 리스트 조회 성공 *****")
                print(result)
                viewController.successGETAPI(result)
            case .failure(let error):
                // 실패
                print("***나의식물 리스트 조회 실패******")
                print(error.localizedDescription)
            }
        }
    }
    

    
    //--------------------과제 PUT------------------------
    
    // 우리 url
    // "http://plantity.shop/myplant/\(assign)/\(userId)/\(myPlantId)"
    
    // test url
    // https://jsonplaceholder.typicode.com/posts/1
    
    //put-MainWater
    func MainWaterAssignDataManager(_ assign: String,_ userId: Int,_ myPlantId: Int,_ viewController:MainPageViewController){
        
        AF.request("http://plantity.shop/myplant/water/1/1",
                   method: .put)
            .validate()
            .responseDecodable(of: MainAssginDataModel.self) { response in

            /** 서버로부터 받은 데이터 활용 */
            switch response.result {
            case .success(let result):
                /** 정상적으로 reponse를 받은 경우 */
                print("=======water성공=====")
                print(result)
            case .failure(let error):
                /** 그렇지 않은 경우 */
                print("=======water실패=====")
                print(error.localizedDescription)
            }
        }
    }
    
    //put-MainLook
    func MainLookAssignDataManager(_ assign: String,_ userId: Int,_ myPlantId: Int,_ viewController:MainPageViewController){
        
        AF.request("http://plantity.shop/myplant/look/1/1",
                   method: .put)
            .validate()
            .responseDecodable(of: MainAssginDataModel.self) { response in

            /** 서버로부터 받은 데이터 활용 */
            switch response.result {
            case .success(let result):
                /** 정상적으로 reponse를 받은 경우 */
                print("=======look성공=====")
                print(result)
            case .failure(let error):
                /** 그렇지 않은 경우 */
                print("=======look실패=====")
                print(error.localizedDescription)
            }
        }
    }
    
    //put-MainSun
    func MainSunAssignDataManager(_ assign: String,_ userId: Int,_ myPlantId: Int,_ viewController:MainPageViewController){
        
        AF.request("http://plantity.shop/myplant/sun/1/1",
                   method: .put)
            .validate()
            .responseDecodable(of: MainAssginDataModel.self) { response in

            /** 서버로부터 받은 데이터 활용 */
            switch response.result {
            case .success(let result):
                /** 정상적으로 reponse를 받은 경우 */
                print("=======sun성공=====")
                print(result)
            case .failure(let error):
                /** 그렇지 않은 경우 */
                print("=======sun실패=====")
                print(error.localizedDescription)
            }
        }
    }
    
    //put-MainRepot
    func MainRepotAssignDataManager(_ assign: String,_ userId: Int,_ myPlantId: Int,_ viewController:MainPageViewController){
        
        AF.request("http://plantity.shop/myplant/repot/1/1",
                   method: .put)
            .validate()
            .responseDecodable(of: MainAssginDataModel.self) { response in

            /** 서버로부터 받은 데이터 활용 */
            switch response.result {
            case .success(let result):
                /** 정상적으로 reponse를 받은 경우 */
                print("=======repot성공=====")
                print(result)
            case .failure(let error):
                /** 그렇지 않은 경우 */
                print("=======repot실패=====")
                print(error.localizedDescription)
            }
        }
    }




}

