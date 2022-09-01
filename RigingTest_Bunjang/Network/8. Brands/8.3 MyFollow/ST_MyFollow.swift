// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let myFollow = try? newJSONDecoder().decode(MyFollow.self, from: jsonData)

import Foundation

// MARK: - MyFollow
struct MyFollow: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let baseResult: [BaseResult_8_3]
}

// MARK: - BaseResult
struct BaseResult_8_3: Codable {
    let brandRes: BrandRes_8_3
    let brandItems: [BrandItem_8_3]
}

// MARK: - BrandItem
struct BrandItem_8_3: Codable {
    let itemIdx: Int
    let cost, itemName, address, period: String
    let imageURL: String
    let isSafePayment, isLike, likeCnt, isCanCheck: Int
    let isAdCheck: Int

    enum CodingKeys: String, CodingKey {
        case itemIdx, cost, itemName, address, period
        case imageURL = "imageUrl"
        case isSafePayment, isLike, likeCnt, isCanCheck, isAdCheck
    }
}

// MARK: - BrandRes
struct BrandRes_8_3: Codable {
    let brandIdx: Int
    let brandName, brandSubName, brandItemCount: String
    let isFollowCheck: Int
    let storeImageURL: String

    enum CodingKeys: String, CodingKey {
        case brandIdx, brandName, brandSubName, brandItemCount, isFollowCheck
        case storeImageURL = "storeImageUrl"
    }
}
