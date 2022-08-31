//
//  ST_addressPOST.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/31.
//

import Foundation

struct AddressPOSTRequestBody: Codable {
    let userName: String
    let address: String
    let detailAddress: String
    let phoneNumber: String
    let isBaseAddress: Int
    let userIdx: Int
}

// MARK: - AddressPOSTResponseBody
struct AddressPOSTResponseBody: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let baseResult: [BaseResult_4_1]
}

// MARK: - BaseResult
struct BaseResult_4_1: Codable {
    let userName, address, detailAddress, phoneNumber: String
    let isBaseAddress: Int
}
