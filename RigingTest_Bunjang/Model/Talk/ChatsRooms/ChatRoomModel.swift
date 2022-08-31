//
//  ItemListsModel.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/24.
//

import Foundation

class ChatRoomListDataModel {
    
    public var ChatRoomListsStruct: [ChatRoomaList] = [
    ]
    
    // MARK: - var
    
    public var count: Int {
        return ChatRoomListsStruct.count
    }
    
    // MARK: - func
    
 
    public func getStoreImageUrl(index: Int) -> String {
        return ChatRoomListsStruct[index].storeImageUrl ?? ""
    }
    
    public func getStoreName(index: Int) -> String {
        return ChatRoomListsStruct[index].storeName ?? ""
    }
    
    public func getPeriod(index: Int) -> String {
        return ChatRoomListsStruct[index].period ?? ""
    }
    
    public func getLastChat(index: Int) -> String {
        return ChatRoomListsStruct[index].lastChat ?? ""
    }
    
    public func inputData(storeImageUrl:String, storeName:String, period:String, lastChat:String) {
        self.ChatRoomListsStruct.append(ChatRoomaList(storeImageUrl: storeImageUrl, storeName: storeName, period: period, lastChat: lastChat))
    }}
