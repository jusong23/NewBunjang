//
//  ST_orders.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/28.
//

import Foundation

struct OrderRequestBody: Codable {
    let addressIdx: Int
    let itemIdx: Int
    let buyUserIdx: Int
    let orderRequest: String
    let isDirectDeal: Int
    let paymentIdx: Int
}

// MARK: - Order
struct ST_Order: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let baseResult: BaseResult_12_3
}

// MARK: - BaseResult
struct BaseResult_12_3: Codable {
    let orderIdx: Int
}

