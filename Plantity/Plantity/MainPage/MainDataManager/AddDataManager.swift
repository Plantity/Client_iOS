//
//  AddDataManager.swift
//  Plantity
//
//  Created by 최은형 on 2022/09/01.
//

import Foundation
import Alamofire

class AddDataManager {
    
    func addDataManager(_ parameter: AddDataInput, _ viewController: AddPlantViewController) {
//        AF.request("http://plantity.shop/myplant/save", method: .post, parameters: parameter, encoder: JSONParameterEncoder.default, headers: nil)
//        .validate()
//        .responseDecodable(of: AddDataModel.self) { response in
//            switch response.result {
//            case .success(let result):
//                if result.success {
//                    // 성공
//                    print(result.msg)
//                } else {
//                    // 실패
//                    print(result.msg)
//                }
//            case .failure(let error):
//                print(error.localizedDescription)
//                }
//            }
//        }
        let header : HTTPHeaders = [
            "Content-Type" : "multipart/form-data",
        ]
        
        let parameters: [String: String?] = [
            "plantName": parameter.plantName,
            "plantType": parameter.plantType,
            "plantAdaptTime": parameter.plantAdaptTime
        ]
        
        AF.upload(multipartFormData: { multipartFormData in
            for (key, value) in parameters {
                if let strValue: String = value {
                    multipartFormData.append("\(strValue)".data(using: .utf8)!, withName: key)
                }
            }
            if let image = parameter.plantImage?.pngData() {
                multipartFormData.append(image, withName: "plantImage", fileName: "\(image).png", mimeType: "image/png")
            }
        }, to: "http://plantity.shop/myplant/save", usingThreshold: UInt64.init(), method: .post, headers: header).responseDecodable(of: AddDataModel.self) {
            response in
                switch response.result {
                case .success(let result):
                    if result.success {
                        // 성공
                        print(result.msg)
                    } else {
                        // 실패
                        print(result.msg)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    }
            }
        }
}
