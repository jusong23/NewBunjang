//
//  ItemListsModel.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/24.
//

import Foundation

class itemListsDataModel {
    
    public var itemListsStruct: [itemLists] = [
    ]
    
    // MARK: - var
    
    public var count: Int {
        return itemListsStruct.count
    }
    
    // MARK: - func
    
    public func getItemIdx(index: Int) -> Int {
        return itemListsStruct[index].itemIdx ?? 0
    }
    
    public func getCost(index: Int) -> String {
        return itemListsStruct[index].cost ?? ""
    }
    
    public func getItemName(index: Int) -> String {
        return itemListsStruct[index].itemName ?? ""
    }
    
    public func getAddress(index: Int) -> String {
        return itemListsStruct[index].address ?? ""
    }
    
    public func getPeriod(index: Int) -> String {
        return itemListsStruct[index].period ?? ""
    }
    
    public func getImageURL(index:Int) -> String {
        return itemListsStruct[index].imageURL ?? ""
    }
    
    public func inputData(itemIdx:Int, cost:String, itemName:String, address:String, period:String, imageURL:String ) {
        self.itemListsStruct.append(itemLists(itemIdx: itemIdx, cost: cost, itemName: itemName, address: address, period: period, imageURL: imageURL))
    }}
