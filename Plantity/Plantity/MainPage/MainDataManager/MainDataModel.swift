//
//  MainDataModel.swift
//  Plantity
//
//  Created by 김다연 on 2022/08/08.
//

import Foundation

/** 받는 데이터 : 메인페이지
 *
 * 사용자정보
 *  사용자이름
 *  등급
 *  게이지
 *  이름
 *
 * 유저식물정보
 *  이미지
 *  식물종
 *  애칭
 *  입양날짜
 *  과제
 *
 * 과제
 *  물주기
 *  햇빛
 *  살펴보기
 *  분갈이
 */



//사용자정보 -> 받을거
struct UserInfo: Decodable {
    let username : String?
    let level : Int?
    let progress : Int?
    
}

//유저식물정보 -> 받을거
struct UserPlant : Decodable {
    let imageUrl : String?
    let type: String?
    let nickname: String?
    let adoptDate: Date?
}


//과제 -> 보낼거
struct Todo:Decodable {
    let water: Bool?
    let sun : Bool?
    let look : Bool?
    let split: Bool?
}


