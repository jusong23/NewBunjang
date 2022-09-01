// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let searchBrands = try? newJSONDecoder().decode(SearchBrands.self, from: jsonData)

import Foundation

// MARK: - SearchBrands
struct SearchBrands: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let baseResult: [BaseResult_8_2]
}

// MARK: - BaseResult
struct BaseResult_8_2: Codable {
    let brandIdx: Int
    let brandName, brandSubName, brandItemCount: String
    let isFollowCheck: Int
    let storeImageURL: String

    enum CodingKeys: String, CodingKey {
        case brandIdx, brandName, brandSubName, brandItemCount, isFollowCheck
        case storeImageURL = "storeImageUrl"
    }
}
