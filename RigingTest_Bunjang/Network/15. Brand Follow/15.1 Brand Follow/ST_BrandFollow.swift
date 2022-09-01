//
//  ST_BrandFollow.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/09/01.
//

import Foundation

// MARK: - BrandFollow
struct BrandFollow: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let baseResult: BaseResult_15_1
}

// MARK: - BaseResult
struct BaseResult_15_1: Codable {
    let userIdx, brandIdx: Int
    let resultMessage: String
}
