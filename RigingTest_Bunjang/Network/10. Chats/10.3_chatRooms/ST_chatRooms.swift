// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let chatRooms = try? newJSONDecoder().decode(ChatRooms.self, from: jsonData)

import Foundation

// MARK: - ChatRooms
struct ChatRooms: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let baseResult: [BaseResult_10_3]
}

// MARK: - BaseResult
struct BaseResult_10_3: Codable {
    let storeImageURL: String
    let storeName, period, lastChat: String
    let itemIdx, chatRoomIdx, storeUserIdx: Int

    enum CodingKeys: String, CodingKey {
        case storeImageURL = "storeImageUrl"
        case storeName, period, lastChat, itemIdx, chatRoomIdx, storeUserIdx
    }
}
