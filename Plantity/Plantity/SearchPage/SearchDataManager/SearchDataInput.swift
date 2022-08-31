//
//  SearchDataInput.swift
//  Plantity
//
//  Created by 최은형 on 2022/08/17.
//

import Foundation
import Alamofire

// post to server
struct SearchDataInput: Encodable {
    var size: Int?
    var page: Int?
}
