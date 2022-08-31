//
//  ItemListsModel.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/24.
//

import Foundation

class SalesViewListsDataModel {
    
    public var SalesViewListsStruct: [SalesViewLists] = [
    ]
    
    // MARK: - var
    
    public var count: Int {
        return SalesViewListsStruct.count
    }
    
    // MARK: - func
    
    public func getItemName(index: Int) -> String {
        return SalesViewListsStruct[index].itemName ?? ""
    }
    
    public func getCost(index: Int) -> String {
        return SalesViewListsStruct[index].cost ?? ""
    }
    
    public func getIsSafeTime(index: Int) -> Int {
        return SalesViewListsStruct[index].isSafePayment ?? 0
    }
    
    public func getUploadTime(index: Int) -> String {
        return SalesViewListsStruct[index].uploadTime ?? ""
    }
    
    public func getImageURL(index:Int) -> String {
        return SalesViewListsStruct[index].imageUrl ?? ""
    }
    
    public func inputData(itemIdx:Int, itemName:String, cost:String, isSafePayment:Int, uploadTime:String, imageUrl:String ) {
        self.SalesViewListsStruct.append(SalesViewLists(itemIdx: itemIdx, itemName: itemName, cost: cost, isSafePayment: isSafePayment, uploadTime: uploadTime, imageUrl: imageUrl))
    }}
