//
//  ItemListsModel.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/24.
//

import Foundation

class BrandListDataModel {
    
    public var BrandListsStruct: [BrandList_Tab] = [
    ]
    
    // MARK: - var
    
    public var count: Int {
        return BrandListsStruct.count
    }
    
    // MARK: - func
    
 
    public func getBrandName(index: Int) -> String {
        return BrandListsStruct[index].brandName ?? ""
    }
    
    public func getBrandSubName(index: Int) -> String {
        return BrandListsStruct[index].brandSubName ?? ""
    }
    
    public func getStoreImageUrl(index: Int) -> String {
        return BrandListsStruct[index].storeImageUrl ?? ""
    }
    
    public func getBrandItemCount(index: Int) -> String {
        return BrandListsStruct[index].brandItemCount ?? ""
    }
    
    public func inputData(brandIdx:Int, brandName:String, brandSubName:String, brandItemCount:String, isFollowCheck:Int, storeImageUrl:String) {
        self.BrandListsStruct.append(BrandList_Tab(brandIdx: brandIdx, brandName: brandName, brandSubName: brandSubName, brandItemCount: brandItemCount, isFollowCheck: isFollowCheck, storeImageUrl: storeImageUrl))
    }}
