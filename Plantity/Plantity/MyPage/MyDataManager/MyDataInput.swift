//
//  MyDataInput.swift
//  Plantity
//
//  Created by 최은형 on 2022/08/15.
//

import Foundation
import Alamofire
// 서버에 넘길 데이터
struct MyDataInput : Encodable {
    var limit : Int?
    var page: Int?
}
