//
//  MainDataInput.swift
//  Plantity
//
//  Created by 김다연 on 2022/09/09.
//

import Foundation
import Alamofire

//보내줄거
//서버에서 보내준 변수 명으로 바꾸기

//사용자정보 -> 뭘 보내줘야 하지?
struct UserInfoInput:Encodable{

}

//유저식물정보 -> 뭘 보내줘야 하지?
struct UserPlantInput : Encodable {

}

//과제 -> 보낼거
struct TodoInput:Encodable {
    var water: Bool?
    var sun : Bool?
    var look : Bool?
    var split: Bool?
}

//--------------------------과제수행여부------------------------------------//

struct TodoRepotInput:Encodable{
    var userId:Int?
    var myPlantId:Int?
}

struct TodoSunInput:Encodable{
    var userId:Int?
    var myPlantId:Int?
}

struct TodoWaterInput:Encodable{
    var userId:Int?
    var myPlantId:Int?
}
