//
//  OtherLoginVC.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/23.
//

import UIKit

class OtherLoginVC: UIViewController {
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var birthTextField: UITextField!
    @IBOutlet var phoneNumberTextField: UITextField!
    @IBOutlet var signInButton: UIButton!
    
    var checkTextField = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.setValue(0, forKey: "ModalKey")
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()

    }
    
    @IBAction func tapToMainTabbar(_ sender: Any) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "mainTabbarVC") else { return }
            self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func tapOkButton(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    

    @IBAction func signUp(_ sender: Any) {
        postSignUp(
            userName: self.userNameTextField.text ?? "",
            phoneNumber: self.phoneNumberTextField.text ?? "",
            birth: self.birthTextField.text ?? ""
        )
    }

}




