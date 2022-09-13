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
    
    func getplantcardTest() {
            let url = "https://jsonplaceholder.typicode.com/todos/1"
            AF.request(url,
                       method: .get,
                       parameters: nil,
                       encoding: URLEncoding.default,
                       headers: ["Content-Type":"application/json", "Accept":"application/json"])
                .validate(statusCode: 200..<300)
                .responseJSON { (json) in
                    //여기서 가져온 데이터를 자유롭게 활용하세요.
                    
                    print(json)
            }
        }
    
    func postTest() {
            let url = "https://ptsv2.com/t/me65x-1663067452/post"
            var request = URLRequest(url: URL(string: url)!)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.timeoutInterval = 10
            
            // POST 로 보낼 정보
            let params = ["id":"아이디", "pw":"패스워드"] as Dictionary

            // httpBody 에 parameters 추가
            do {
                try request.httpBody = JSONSerialization.data(withJSONObject: params, options: [])
            } catch {
                print("http Body Error")
            }
            
            AF.request(request).responseString { (response) in
                switch response.result {
                case .success:
                    print("POST 성공")
                case .failure(let error):
                    print("🚫 Alamofire Request Error\nCode:\(error._code), Message: \(error.errorDescription!)")
                }
            }
        }
    
    func getTest() {
            let url = "https://jsonplaceholder.typicode.com/todos/1"
            AF.request(url,
                       method: .get,
                       parameters: nil,
                       encoding: URLEncoding.default,
                       headers: ["Content-Type":"application/json", "Accept":"application/json"])
                .validate(statusCode: 200..<300)
                .responseJSON { response in
                    //가져온 데이터 활용
                    switch response.result{
                    case.success(let value):
                        if let jsonObj=value as?[String:Any]{
                            print("데이터의 갯수:\(jsonObj.count)")
                            if let id=jsonObj["id"]{
                                print("userid=\(id)")
                            }
                            if let title=jsonObj["title"]{
                                print("title=\(title)")
                            }
                        }
                    case.failure(let error):
                        print("error: \(String(describing: error.errorDescription))")
                    }
//                    print(response)
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

