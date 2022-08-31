//
//  ST_LikesAPI.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/31.
//

import Foundation

// MARK: - LikesPost
struct LikesPost: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let baseResult: BaseResult_5_2
}

// MARK: - BaseResult
struct BaseResult_5_2: Codable {
    let userIdx, itemIdx: Int
    let resultMessage: String
}
