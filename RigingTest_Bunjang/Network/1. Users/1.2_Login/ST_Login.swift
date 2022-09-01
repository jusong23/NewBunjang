//
//  ST_Login.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/09/02.
//

import Foundation

// MARK: - LoginRequest
struct LoginRequest: Codable {
    let phoneNumber: String
}


// MARK: - LoginResponse
struct LoginResponse: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let baseResult: BaseResult
}

// MARK: - BaseResult
struct BaseResult: Codable {
    let userIdx: Int
    let jwt: String
}
