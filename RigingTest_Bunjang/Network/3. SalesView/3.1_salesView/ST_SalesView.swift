// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let salesView = try? newJSONDecoder().decode(SalesView.self, from: jsonData)

import Foundation

// MARK: - SalesView
struct SalesView: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let baseResult: [BaseResult_3_1]
}

// MARK: - BaseResult
struct BaseResult_3_1: Codable {
    let itemIdx: Int
    let itemName, cost: String
    let isSafePayment: Int
    let uploadTime: String
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case itemIdx, itemName, cost, isSafePayment, uploadTime
        case imageURL = "imageUrl"
    }
}
