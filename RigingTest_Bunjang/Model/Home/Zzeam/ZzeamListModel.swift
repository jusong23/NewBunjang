//
//  ItemListsModel.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/24.
//

import Foundation

class ZzeamsListsDataModel {
    
    public var ZzeamListsStruct: [ZzeamLists] = [
    ]
    
    // MARK: - var
    
    public var count: Int {
        return ZzeamListsStruct.count
    }
    
    // MARK: - func

    public func getCost(index: Int) -> String {
        return ZzeamListsStruct[index].cost ?? ""
    }
    
    public func getItemName(index: Int) -> String {
        return ZzeamListsStruct[index].itemName ?? ""
    }
    
    public func getUserName(index: Int) -> String {
        return ZzeamListsStruct[index].userName ?? ""
    }
    
    public func getUploadTime(index: Int) -> String {
        return ZzeamListsStruct[index].uploadTime ?? ""
    }
    
    public func getImageURL(index:Int) -> String {
        return ZzeamListsStruct[index].imageUrl ?? ""
    }
    
    public func inputData(itemIdx:Int, itemName:String, cost:String, userName:String, status:String, isSafePayment:Int, uploadTime:String, imageUrl:String ) {
        self.ZzeamListsStruct.append(ZzeamLists(itemIdx: itemIdx, itemName: itemName, cost: cost, userName: userName, status: status, isSafePayment: isSafePayment, uploadTime: uploadTime, imageUrl: imageUrl))
    }}
