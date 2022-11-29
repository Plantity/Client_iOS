//
//  AddDataModel.swift
//  Plantity
//
//  Created by 최은형 on 2022/09/01.
//

import Foundation

struct AddDataModel: Decodable {
    // POST 성공시
    let isSuccess: Bool
    let code: Int
    let message: String
}
