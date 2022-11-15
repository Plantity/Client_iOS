//
//  GuideModel.swift
//  Plantity
//
//  Created by 최은형 on 2022/08/06.
//

import Foundation

/** 받는 데이터 : 가이드라인
 *  제목
 *  사진
 *  본문
 *  요약
 */

struct GuideModel : Decodable {
    let isSuccess : Bool
    let code: Int
    let message: String
    let result: GuideModelResult?
}

struct GuideModelResult : Decodable {
    let title: String?
    let subtitle: String?
    let content: [GuideContentModel]?
    //let summary: [String]?
    let image: String?
}

    struct GuideContentModel : Decodable {
    let subtitle: String?
    let text: String?
}
