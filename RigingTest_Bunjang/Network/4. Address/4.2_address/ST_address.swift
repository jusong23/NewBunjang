// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let address = try? newJSONDecoder().decode(Address.self, from: jsonData)

import Foundation

// MARK: - Address
struct Address_GET: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let baseResult: [BaseResult_4_2]
}

// MARK: - BaseResult
struct BaseResult_4_2: Codable {
    let userName, address, detailAddress, phoneNumber: String
    let isBaseAddress: Int
}
