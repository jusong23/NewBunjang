//
//  ST_GetLikes.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/31.
//

import Foundation

// MARK: - LikesGet
struct LikesGet: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let baseResult: [BaseResult_5_1]
}

// MARK: - BaseResult
struct BaseResult_5_1: Codable {
    let itemIdx: Int
    let itemName, cost, userName, status: String
    let isSafePayment: Int
    let uploadTime: String
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case itemIdx, itemName, cost, userName, status, isSafePayment, uploadTime
        case imageURL = "imageUrl"
    }
}
