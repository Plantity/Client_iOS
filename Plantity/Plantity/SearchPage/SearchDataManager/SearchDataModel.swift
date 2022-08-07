//
//  SearchDataModel.swift
//  Plantity
//
//  Created by 최은형 on 2022/08/06.
//

import Foundation

/** 받는 데이터 : 검색페이지 식물정보
 *  사진
 *  식물이름(종류)
 *  난이도
 *  식물소개
 *  물주기
 *  햇빛
 *  (태그)
 */

struct SearchModel : Decodable {
    let isSuccess : Bool
    let code: Int
    let message: String
    let result: SearchPlantModel?
}

struct SearchPlantModel: Decodable {
    // let imageUrl: String?
    let name: String?
    let level: Int?
    let intro: String?
    // let water: Int?
    // let sunshine: Int?
    let tag: String?
}
