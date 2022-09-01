//
//  ItemListsModel.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/24.
//

import Foundation

class SearchedListDataModel {
    
    public var SearchedListsStruct: [SearchedList] = [
    ]
    
    // MARK: - var
    
    public var count: Int {
        return SearchedListsStruct.count
    }
    
    // MARK: - func
    
 
    public func getBrandName(index: Int) -> String {
        return SearchedListsStruct[index].brandName ?? ""
    }
    
    public func getBrandSubName(index: Int) -> String {
        return SearchedListsStruct[index].brandSubName ?? ""
    }
    
    public func getStoreImageUrl(index: Int) -> String {
        return SearchedListsStruct[index].storeImageUrl ?? ""
    }
    
    public func getBrandItemCount(index: Int) -> String {
        return SearchedListsStruct[index].brandItemCount ?? ""
    }
    
    public func inputData(brandIdx:Int, brandName:String, brandSubName:String, brandItemCount:String, isFollowCheck:Int, storeImageUrl:String) {
        self.SearchedListsStruct.append(SearchedList(brandIdx: brandIdx, brandName: brandName, brandSubName: brandSubName, brandItemCount: brandItemCount, isFollowCheck: isFollowCheck, storeImageUrl: storeImageUrl))
    }
    
    public func removeData() {
        self.SearchedListsStruct.removeAll()
    }
    
}

