//
//  ST_Brands.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/09/01.
//

import Foundation

// MARK: - Brands
struct Brands_8_1: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let baseResult: [BaseResult_8_1]
}

// MARK: - BaseResult
struct BaseResult_8_1: Codable {
    let brandIdx: Int
    let brandName, brandSubName, brandItemCount: String
    let isFollowCheck: Int
    let storeImageURL: String

    enum CodingKeys: String, CodingKey {
        case brandIdx, brandName, brandSubName, brandItemCount, isFollowCheck
        case storeImageURL = "storeImageUrl"
    }
}
