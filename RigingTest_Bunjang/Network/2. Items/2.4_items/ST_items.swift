//
//  ST_items.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/24.
//

import Foundation

struct Items: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let baseResult: [Result_items]
}

// MARK: - Result
struct Result_items: Codable {
    let itemIdx : Int
    let cost: String
    let itemName, address, period: String
    let imageURL: String?
    let isSafePayment, isLike, likeCnt, isCanCheck: Int
    let isAdCheck: Int

    enum CodingKeys: String, CodingKey {
        case itemIdx, cost, itemName, address, period
        case imageURL = "imageUrl"
        case isSafePayment, isLike, likeCnt, isCanCheck, isAdCheck
    }
}
