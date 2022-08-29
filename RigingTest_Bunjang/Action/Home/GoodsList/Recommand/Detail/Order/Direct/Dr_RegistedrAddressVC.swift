//
//  RegisterAddressVC.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/26.
//

import UIKit

protocol SendAddressDelegate_Direct: AnyObject {
    func sendAddress(address:String, addressDetail:String, userName:String, userPhoneNumber:String)
}

class Dr_RegistedrAddressVC: UIViewController {

    var getOrderIndirect = get_12_1_order_indirect ()
    
    @IBOutlet var address: UILabel!
    @IBOutlet var addressDetail: UILabel!
    @IBOutlet var userName: UILabel!
    @IBOutlet var userPhoneNumber: UILabel!
    
    
    weak var delegate: SendAddressDelegate_Direct?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.address.sizeToFit()
        self.addressDetail.sizeToFit()
        
        // MARK: - [GET] 12.1 택배 거래시 필요한 데이터 가져오기 /indirect/\(itemInx)/0
        self.getOrderIndirect.getOrderIndirect(accessToken: JwtToken.token, itemIdx: selectedKey, onCompleted: {
            [weak self] result in // 순환 참조 방지, 전달인자로 result
            guard let self = self else { return } // 일시적으로 strong ref가 되게
    
            switch result {
            case let .success(result):
            
                self.address.text = result.baseResult.address.address
                self.addressDetail.text = result.baseResult.address.detailAddress
                self.userName.text = result.baseResult.address.userName
                self.userPhoneNumber.text = result.baseResult.address.phoneNumber
                
            case let .failure(error):
                debugPrint("error \(error)")
            }
        })
    }
    
    
    @IBAction func sendAddress(_ sender: Any) {
        
        
        self.delegate?.sendAddress(address: self.address.text ?? "",
                                   addressDetail: self.addressDetail.text ?? "",
                                   userName: self.userName.text ?? "",
                                   userPhoneNumber: self.userPhoneNumber.text ?? "")
        self.dismiss(animated: true)
    }
}
