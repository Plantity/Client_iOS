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
//        let req: NSMutableURLRequest?
//            (req!, _) = Alamofire.ParameterEncoding.URL.encode(
//                NSURLRequest(URL: NSURL(string: "http://plantity.shop/myplant/save/\(221)")!),
//                parameters: ["cntntsNo":cntntsNo]
//            )
        
        let urlStr = "http://plantity.shop/myplant/save/\(223)?cntntsNo=\(cntntsNo)"
        guard let encodedStr = urlStr.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }

        let url = URL(string: encodedStr)!

        AF.upload(multipartFormData: { multipart in
            // 이미지
            if let image = imageData?.pngData() {
                multipart.append(image, withName: "image", fileName: "\(cntntsNo).png", mimeType: "image/png")
           }

            // 세부 데이터
//            for (key, value) in parameters {
//                if let strValue: String = value {
//                    multipart.append("\(strValue)".data(using: .utf8)!, withName: key)
//                }
//            }
            multipart.append(inputData.plantName!.data(using: .utf8)!, withName: "plantName")
            multipart.append(inputData.plantNickName!.data(using: .utf8)!, withName: "plantNickName")
            multipart.append(inputData.plantAdaptTime!.data(using: .utf8)!, withName: "plantAdaptTime")
            multipart.append(cntntsNo.data(using: .utf8)!, withName: "cntntsNo")

        }
                  , to: url
                  , method: .post
        )
        .responseString { response in
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
