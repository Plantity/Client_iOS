//
//  LogDataModel.swift
//  Plantity
//
//  Created by 김다연 on 2022/08/08.
//

import Foundation


/** 받는 데이터 : 로그페이지
 *
 * 유저식물정보
 *  식물사진
 *  애칭
 *  식물종
 *  난이도
 *  물주기메모
 *
 * 과제수행여부
 *  물주기
 *  햇빛
 *  살펴보기
 *  분갈이
 */

// -- 식물 목록--//
//유저식물정보

//내 식물 목록 GET
struct LogUserPlantModel : Decodable {
    let isSuccess : Bool
    let code: Int
    let message: String
    let result: [LogUserPlant]?
}

//유저식물정보 -> 받을거
struct LogUserPlant : Decodable {
    let myPlantId : Int?
    let plantName: String?
    let plantNickName: String?
    let plantAdaptTime: String?
    let filePath: String?
}



//-- 달력 --//

// 식물 각각의 캘린더
struct LogCalendar : Decodable {
    var date: [String]
    var todos: [TodoLog]
}

//달력-과제수행여부
struct TodoLog:Decodable {
    let didwater: Bool?
    let didsun : Bool?
    let didlook : Bool?
    let didsplit: Bool?
}

// *************** 과제 request 성공했을때 **************//
// 과제(분갈이) -> POST 성공시
struct LogRepotDataModel:Decodable {
    let isSuccess : Bool
    let code: Int
    let message: String
    let result: String
}

//과제(햇빛) -> POST 성공
struct LogSunDataModel:Decodable {
    let isSuccess : Bool
    let code: Int
    let message: String
    let result: String
}


//과제(물주기) -> POST 성공
struct LogWaterDataModel:Decodable {
    let isSuccess : Bool
    let code: Int
    let message: String
    let result: String
}

//과제(쳐다보기) -> POST 성공
struct LogLookDataModel:Decodable {
    let isSuccess : Bool
    let code: Int
    let message: String
    let result: String
}

struct AssginDataModel: Decodable {
    let isSuccess : Bool
    let code: Int
    let message: String
    let result: String
}
