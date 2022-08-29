//
//  ST_payment_userId(POST).swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/27.
//

import Foundation

struct PaymentUserIDPostRequset: Codable {
    let accountName: String
}

// MARK: - PaymentUserIDPost
struct PaymentUserIDPost: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let baseResult: BaseResult_13_1
}

// MARK: - BaseResult
struct BaseResult_13_1: Codable {
    let paymentIdx: Int
}
