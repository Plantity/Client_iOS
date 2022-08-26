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

struct SearchDataModel : Decodable {
    let isSuccess : Bool
    let code: Int
    let message: String
    var result: [SearchDataModelResult]?
}

struct SearchDataModelResult: Decodable {
    let plantIdx: Int?
    let cntntsNo: String?
    let cntntsSj: String?
    let plntbneNm: String?
    let plntzrNm: String?
    let adviseInfo: String?
    let orgplceInfo: String?
    let lighttdemanddoCodeNm: String?
    let ignSeasonCodeNm: String?
    let flclrCodeNm: String?
    let watercycleSprngCodeNm: String?
    let managelevelCode: String?
    let plantFollowings: [String]?
}

struct SearchPlantModel: Decodable {
    // let imageUrl: String?
    let name: String?
    let level: Int?
    let intro: String?
    let water: String?
    let sun: String?
    var isUserLiked: Bool?
    // let details: PlantDetailModel?
    let tag: String?
}
