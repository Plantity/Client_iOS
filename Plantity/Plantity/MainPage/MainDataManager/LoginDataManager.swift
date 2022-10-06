//
//  LoginDataManager.swift
//  Plantity
//
//  Created by 최은형 on 2022/10/04.
//

import Foundation
import Alamofire

class LoginDataManager {
    
    func loginDataManager(_ parameter: String, _ viewController: LoginViewController) {
        AF.request("http://plantity.shop/user/signin", method: .post, parameters: parameter, encoder: JSONParameterEncoder.default, headers: nil)
        .validate()
        .responseDecodable(of: LoginDataModel.self) { response in
            switch response.result {
            case .success(let result):
                if result.isSuccess {
                    // 성공
                    print(result.message)
                    viewController.successLogin(result.result)
                } else {
                    // 실패
                    print(result.message)
                }
            case .failure(let error):
                print(error.localizedDescription)
                }
            }
        }
}
