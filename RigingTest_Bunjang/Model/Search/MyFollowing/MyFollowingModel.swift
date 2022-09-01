//
//  ItemListsModel.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/24.
//

import Foundation

class MyFollwingListDataModel {
    
    public var MyFollwingListsStruct: [MyFollowingList] = [
    ]
    
    // MARK: - var
    
    public var count: Int {
        return MyFollwingListsStruct.count
    }
    
    // MARK: - func
    
 
    public func getBrandName(index: Int) -> String {
        return MyFollwingListsStruct[index].brandName ?? ""
    }
    
    public func getBrandSubName(index: Int) -> String {
        return MyFollwingListsStruct[index].brandSubName ?? ""
    }
    
    public func getStoreImageUrl(index: Int) -> String {
        return MyFollwingListsStruct[index].storeImageUrl ?? ""
    }
    
    public func getBrandItemCount(index: Int) -> String {
        return MyFollwingListsStruct[index].brandItemCount ?? ""
    }
    
    public func inputData(brandIdx:Int, brandName:String, brandSubName:String, brandItemCount:String, isFollowCheck:Int, storeImageUrl:String) {
        self.MyFollwingListsStruct.append(MyFollowingList(brandIdx: brandIdx, brandName: brandName, brandSubName: brandSubName, brandItemCount: brandItemCount, isFollowCheck: isFollowCheck, storeImageUrl: storeImageUrl))
    }
    
    public func removeData() {
        self.MyFollwingListsStruct.removeAll()
    }
    
}

