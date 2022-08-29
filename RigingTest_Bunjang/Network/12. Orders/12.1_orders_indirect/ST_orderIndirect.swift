//
//  ST_orderIndirect.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/26.
//

import Foundation

// MARK: - OrderIndirect
struct OrderIndirect: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let baseResult: BaseResult_12_1
}

// MARK: - BaseResult
struct BaseResult_12_1: Codable {
    let address: Address
    let itemName, itemImageURL: String
    let point: Int
    let itemCost, safePayCost, isIncludeOrderTip, totalCost: String

    enum CodingKeys: String, CodingKey {
        case address, itemName
        case itemImageURL = "itemImageUrl"
        case point, itemCost, safePayCost, isIncludeOrderTip, totalCost
    }
}

// MARK: - Address
struct Address: Codable {
    let addressIdx: Int
    let userName, address, detailAddress, phoneNumber: String
}
