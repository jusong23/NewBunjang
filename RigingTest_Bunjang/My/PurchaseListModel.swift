//
//  ItemListsModel.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/24.
//

import Foundation

class PurchaseListDataModel {
    
    public var PurchaseListsStruct: [purchase_ST] = [
    ]
    
    // MARK: - var
    
    public var count: Int {
        return PurchaseListsStruct.count
    }
    
    // MARK: - func
    
    public func getOrderIdx(index: Int) -> Int {
        return PurchaseListsStruct[index].orderIdx ?? 0
    }
    
    public func getItemName(index: Int) -> String {
        return PurchaseListsStruct[index].itemName ?? ""
    }
    
    public func getItemCost(index: Int) -> String {
        return PurchaseListsStruct[index].itemCost ?? ""
    }
    
    public func getItemUrl(index: Int) -> String {
        return PurchaseListsStruct[index].itemUrl ?? ""
    }
    
    public func getStoreName(index: Int) -> String {
        return PurchaseListsStruct[index].storeName ?? ""
    }
    
    public func getOrderTime(index: Int) -> String {
        return PurchaseListsStruct[index].orderTime ?? ""
    }
    
    public func inputData(orderIdx:Int, itemName:String, itemCost:String, itemUrl:String, storeName:String, orderTime:String) {
        self.PurchaseListsStruct.append(purchase_ST(orderIdx: orderIdx, itemName: itemName, itemCost: itemCost, itemUrl: itemUrl, storeName: storeName, orderTime: orderTime))
    }}
