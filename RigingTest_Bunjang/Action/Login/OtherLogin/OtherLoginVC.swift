//
//  OtherLoginVC.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/23.
//

import UIKit

class OtherLoginVC: UIViewController {
    
    var Post_1_1 = post_1_1 ()
    
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

    @IBAction func signUp(_ sender: Any) {
        self.Post_1_1.post_1_1_SignUp(
            userName: self.userNameTextField.text ?? "",
            phoneNumber: self.phoneNumberTextField.text ?? "",
            birth: self.birthTextField.text ?? "")
        
        DispatchQueue.main.async {
            guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "mainTabbarVC") else { return }
            self.view.window?.rootViewController = viewController
            self.view.window?.makeKeyAndVisible()
            self.navigationController?.pushViewController(viewController, animated: true)

        }
        
    }

}




