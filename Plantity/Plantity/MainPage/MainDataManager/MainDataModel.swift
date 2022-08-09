//
//  MainDataModel.swift
//  Plantity
//
//  Created by 김다연 on 2022/08/08.
//

import Foundation

/** 받는 데이터 : 메인페이지
 *  이름
 *  한줄멘트
 *  게이지바 정도
 *  사용자 설정식물 이름
 *  식물사진
 *  물주기
 *  분갈이
 *  살펴보기
 *  씻겨주기
 */


struct MainDataModel : Decodable {
    
    let userName : String?
    let todayLabel : String?
    let gaugeBar : Int?

}


struct MainDataModelCard: Decodable {
    
    let plantName : String?
    let plantImage : String?
    
    let watering : Bool?
    let soiling : Bool?
    let watching : Bool?
    let showering : Bool?
    
}
