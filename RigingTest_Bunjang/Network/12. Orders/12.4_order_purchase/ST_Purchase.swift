//
//  ST_Purchase.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/30.
//

import Foundation

// MARK: - Purchase
struct Purchase: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let baseResult: [BaseResult_12_4]
}

// MARK: - BaseResult
struct BaseResult_12_4: Codable {
    let orderIdx: Int
    let itemName, itemCost: String
    let itemURL: String
    let storeName, orderTime: String

    enum CodingKeys: String, CodingKey {
        case orderIdx, itemName, itemCost
        case itemURL = "itemUrl"
        case storeName, orderTime
    }
}
