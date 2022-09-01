//
//  AddDataInput.swift
//  Plantity
//
//  Created by 최은형 on 2022/09/01.
//

import Foundation
import Alamofire

// post to server
struct AddDataInput: Encodable {
    let plantName: String?
    let plantType: String?
    let plantImage: String?
    let plantAdaptTime: String? // Should be "yyyy-MM-dd"
}
