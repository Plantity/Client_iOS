//
//  LoginDataModel.swift
//  Plantity
//
//  Created by 최은형 on 2022/10/04.
//

import Foundation
import Alamofire

struct LoginDataModel : Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: LoginResultModel
}

struct LoginResultModel: Decodable {
    var userId: String  // 숫자
    var social: String  // 이메일값
    var socialType: String // 소셜로그인 api 제공자
    var nickName: String   // userId
}
