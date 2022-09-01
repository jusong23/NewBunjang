//
//  ST_sign-up.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/23.
//

import Foundation

struct SignUp: Codable {
    let userName, phoneNumber, birth: String
}

// MARK: - SignedUpInfo
struct SignedUpInfo: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let baseResult: BaseResult_1_1
}

// MARK: - BaseResult
struct BaseResult_1_1: Codable {
    let jwt: String
    let userIdx: Int
}
