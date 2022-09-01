//
//  ItemListsModel.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/24.
//

import Foundation

class RecommandBrandListDataModel {
    
    public var RecommandBrandListsStruct: [BrandList] = [
    ]
    
    // MARK: - var
    
    public var count: Int {
        return RecommandBrandListsStruct.count
    }
    
    // MARK: - func
    
 
    public func getBrandName(index: Int) -> String {
        return RecommandBrandListsStruct[index].brandName ?? ""
    }
    
    public func getBrandSubName(index: Int) -> String {
        return RecommandBrandListsStruct[index].brandSubName ?? ""
    }
    
    public func getImageUrl(index: Int) -> String {
        return RecommandBrandListsStruct[index].imageUrl ?? ""
    }
    
    public func getBrandItemCnt(index: Int) -> String {
        return RecommandBrandListsStruct[index].brandItemCnt ?? ""
    }
    
    public func inputData(brandName:String, brandSubName:String, imageUrl:String, brandItemCnt:String, isFollowing:Int) {
        self.RecommandBrandListsStruct.append(BrandList(brandName: brandName, brandSubName: brandSubName, imageUrl: imageUrl, brandItemCnt: brandItemCnt, isFollowing: isFollowing))
    }}
