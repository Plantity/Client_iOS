//
//  LogDataInput.swift
//  Plantity
//
//  Created by 최은형 on 2022/10/04.
//

import Foundation
import Alamofire

struct LoginDataInput : Encodable{
    var social_token : String // "accesstoken",
    var social_type : String  // "kakao",
    var nickName : String     // "userId",
    var social : String       // "userEmail@email.com"
}
