//
//  AddAddressVC.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/31.
//

import UIKit

class AddAddressVC: UIViewController {
    
    var BaseAddress = 0
    var Post_4_1 = post_4_1 ()

    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var userPhoneNumberTF: UITextField!
    @IBOutlet weak var userAddressTF: UITextField!
    @IBOutlet weak var userDetailAddressTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func checkBaseAddress(_ sender: Any) {
        if self.checkButton.isSelected == false {
            self.checkButton.isSelected = true
            self.checkButton.tintColor = .mainRed
            self.checkButton.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .selected)
            self.BaseAddress = 1
        } else {
            self.checkButton.isSelected = false
            self.checkButton.tintColor = .lightGray
            self.checkButton.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .selected)
            self.BaseAddress = 0
        }
    }
    
    @IBAction func tabBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addAddress(_ sender: Any) {
        self.Post_4_1.post_4_1_(
            accessToken: JwtToken.token,
            userName: self.userNameTF.text ?? "",
            address: self.userAddressTF.text ?? "",
            detailAddress: self.userDetailAddressTF.text ?? "",
            phoneNumber: self.userPhoneNumberTF.text ?? "",
            isBaseAddress: self.BaseAddress,
            userIdx: Int(User.Idx) ?? 0)
        
    }

}


