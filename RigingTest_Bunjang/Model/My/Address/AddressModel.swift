//
//  ItemListsModel.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/24.
//

import Foundation

class AddressListDataModel {
    
    public var AddressListsStruct: [AddressList] = [
    ]
    
    // MARK: - var
    
    public var count: Int {
        return AddressListsStruct.count
    }
    
    // MARK: - func
    
 
    public func getUserName(index: Int) -> String {
        return AddressListsStruct[index].userName ?? ""
    }
    
    public func getAddress(index: Int) -> String {
        return AddressListsStruct[index].address ?? ""
    }
    
    public func getDetail(index: Int) -> String {
        return AddressListsStruct[index].detailAddress ?? ""
    }
    
    public func getPhoneNumber(index: Int) -> String {
        return AddressListsStruct[index].phoneNumber ?? ""
    }
    
    public func inputData(userName:String, address:String, detailAddress:String, phoneNumber:String, isBaseAddress:Int) {
        self.AddressListsStruct.append(AddressList(userName: userName, address: address, detailAddress: detailAddress, phoneNumber: phoneNumber, isBaseAddress: isBaseAddress))
    }}
