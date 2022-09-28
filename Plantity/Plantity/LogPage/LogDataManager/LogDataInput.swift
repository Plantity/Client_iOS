//
//  LogDataInput.swift
//  Plantity
//
//  Created by 김다연 on 2022/09/28.
//

import Foundation

// 서버에 보내줄 로그 정보

// 분갈이
struct LogRepotInput:Encodable{
    var userId:Int?
    var myPlantId:Int?
}

// 햇살주기
struct LogSunInput:Encodable{
    var userId:Int?
    var myPlantId:Int?
}

// 물주기
struct LogWaterInput:Encodable{
    var userId:Int?
    var myPlantId:Int?
}

// 살펴보기
struct LogWatchInput:Encodable{
    var userId:Int?
    var myPlantId:Int?
}
