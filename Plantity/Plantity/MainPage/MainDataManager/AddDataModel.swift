//
//  AddDataModel.swift
//  Plantity
//
//  Created by 최은형 on 2022/09/01.
//

import Foundation

struct AddDataModel: Decodable {
    // POST 성공시
    let success: Bool
    let msg: String
    let timestamp: String
}
