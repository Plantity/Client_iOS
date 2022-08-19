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

//유저식물정보
struct LogUserPlant : Decodable {
    let imageUrl : String?
    let nickname: String?
    let type: String?
    let plantlevel : Int?
    let plantMemo:String?

}

//달력-과제수행여부
struct TodoLog:Decodable {
    let didwater: Bool?
    let didsun : Bool?
    let didlook : Bool?
    let didsplit: Bool?
}
