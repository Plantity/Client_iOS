//
//  AddDataManager.swift
//  Plantity
//
//  Created by 최은형 on 2022/09/01.
//

import Foundation
import Alamofire

class AddDataManager {
    
    func addDataManager(_ imageData: UIImage?, _ inputData: AddDataInput, _ viewController: AddPlantViewController, _ cntntsNo: String) {

//        let header: HTTPHeaders = [
//            "Content-Type" : "multipart/form-data"
//        ]
        
        let parameters: [String: String?] = [
            "plantName": inputData.plantName,
            "plantNickName": inputData.plantNickName,
            "plantAdaptTime": inputData.plantAdaptTime
        ]

        AF.upload(multipartFormData: { multipart in
            // 이미지
            if let image = imageData?.pngData() {
                multipart.append(image, withName: "image", fileName: "\(cntntsNo).png", mimeType: "image/png")
           }

            // 세부 데이터
            for (key, value) in parameters {
                if let strValue: String = value {
                    multipart.append("\(strValue)".data(using: .utf8)!, withName: key)
                }
            }

        }, to: "http://plantity.shop/myplant/save/\(1)?cntntsNo=\(cntntsNo)", method: .post).responseString { response in
//            switch response.result {
//            case .success(let result):
//                print(result.message)
//            case .failure(let error):
//                print(error)
//            }
            print(response)
            guard let statusCode = response.response?.statusCode
            else { return }
            print(statusCode)
        }
    }
}
