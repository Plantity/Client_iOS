//
//  LogDataModel.swift
//  Plantity
//
//  Created by 김다연 on 2022/08/08.
//

import Foundation


/** 받는 데이터 : 메인페이지
 *
 *  식물이름
 *  식물종류
 *  난이도
 *  카드메모
 *
 *  물주기
 *  살펴보기
 *  씻겨주기
 *  분갈이
 *
 */


struct LogDataCardModel : Decodable {
    
    let plantName : String?
    let plantType : String?
//    let level : String?
    let cardMemo : String?

}


struct LogDataCalendar : Decodable {
    
    let watering : Bool?
    let watching : Bool?
    let showering : Bool?
    let soiling : Bool?
    
}
