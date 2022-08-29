//
//  ST_patments_userId(GET).swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/27.
//

import Foundation

// MARK: - PaymentUserIDGETResponse
struct PaymentUserIDGETResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let baseResult: BaseResult_13_2
}

// MARK: - BaseResult
struct BaseResult_13_2: Codable {
    let paymentIdx, accountIdx: Int
    let accountName: String
    let monthlyPlan: Int
}
