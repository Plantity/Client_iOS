//
//  MyDataModel.swift
//  Plantity
//
//  Created by 최은형 on 2022/08/06.
//

import Foundation
import Alamofire

/**  받는 데이터 : 마이페이지 유저 정보
 *  나의 정보
 *      이름
 *      유저아이디
 *      등급
 *      레벨게이지
 *  나의 식물
 *      사진
 *      식물종류
 *      애칭
 *      입양날짜
 *  내가 찜한 식물
 *      검색모델 재탕
 */

struct MyDataModel : Decodable {
    let isSuccess : Bool
    let code: Int
    let message: String
    let result: MyModelResult?
}

struct MyModelResult: Decodable {
    let myInfo: MyInfo?
    let myPlants: [String?] // 이름으로 데이터 찾을거임
    let myLikes: [String?]  // 이름으로 데이터 찾을거임
}

struct MyInfo: Decodable {
    let username: String?
    let userId: String?
    let level: Int?
    let progress: Int?
}

struct MyPlantModel: Decodable {
    // let imageUrl: String?
    let name: String?
    let nickname: String?
    let adoptDate: Date?
}
