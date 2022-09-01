//
//  ST_Search.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/09/01.
//

import Foundation

// MARK: - Search
struct Search_7_2: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let baseResult: BaseResult_7_2
}

// MARK: - BaseResult
struct BaseResult_7_2: Codable {
    let searchList: [SearchList_7_2]
    let brandNameList: [BrandNameList_7_2]
}

// MARK: - BrandNameList
struct BrandNameList_7_2: Codable {
    let brandName, brandSubName, imageURL, brandItemCnt: String
    let isFollowing: Int

    enum CodingKeys: String, CodingKey {
        case brandName, brandSubName
        case imageURL = "imageUrl"
        case brandItemCnt, isFollowing
    }
}

// MARK: - SearchList
struct SearchList_7_2: Codable {
    let userIdx, searchIdx: Int
    let searchText: String
}
