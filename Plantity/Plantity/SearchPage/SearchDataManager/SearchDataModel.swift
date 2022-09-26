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
    let result: SearchDataModelResult
}

struct SearchDataModelResult: Decodable {
    let content : [SearchPlantModel]
    let pageable: pageableModel
    let last: Bool
    let totalPages: Int
    let totalElements: Int
    let first: Bool
    let size: Int
    let number: Int
    let sort: sortModel
    let numberOfElements: Int
    let empty: Bool
}

struct pageableModel : Decodable {
    let sort: sortModel
    let offset: Int
    let pageNumber: Int
    let pageSize: Int
    let paged: Bool
    let unpaged: Bool
}

struct sortModel : Decodable {
    let empty: Bool
    let sorted: Bool
    let unsorted: Bool
}

struct SearchPlantModel : Decodable {
    let plantIdx: Int
    let cntntsNo: String
    let cntntsSj: String
    let plntbneNm: String
    let plntzrNm: String
    let adviseInfo: String
    let orgplceInfo: String
    let lighttdemanddoCodeNm: String
    let ignSeasonCodeNm: String
    let flclrCodeNm: String
    let watercycleSprngCodeNm: String
    let managelevelCode: String
    //let plantFollowings: [Int]
}

// 상제보기 모델
struct DetailDataModel : Decodable {
    let isSuccess : Bool
    let code: Int
    let message: String
    let result: SearchPlantModel
}
