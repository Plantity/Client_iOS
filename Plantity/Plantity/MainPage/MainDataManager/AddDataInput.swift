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
    //var image: UIImage
    var plantName: String? // plantType
    var plantNickName: String?
    var plantAdaptTime: String? // Should be "yyyy-MM-dd"
}
