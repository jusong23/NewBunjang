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
//        makeRootVC()
    }
    
//    func makeRootVC() {
//        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "OtherLoginVC") as? OtherLoginVC else {return}
//        self.view.window?.rootViewController = viewController
//        self.view.window?.makeKeyAndVisible()
//    }
    
//    @IBAction func tapToMainTabbar(_ sender: Any) {
//        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "mainTabbarVC") else { return }
//            self.navigationController?.pushViewController(viewController, animated: true)
//    }
    

    @IBAction func signUp(_ sender: Any) {
//        postSignUp(
//            userName: self.userNameTextField.text ?? "",
//            phoneNumber: self.phoneNumberTextField.text ?? "",
//            birth: self.birthTextField.text ?? ""
//        )
        
        postLogin(phoneNumber: self.phoneNumberTextField.text ?? "")
       
        DispatchQueue.main.async {
            guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "mainTabbarVC") else { return }
            self.view.window?.rootViewController = viewController
            self.view.window?.makeKeyAndVisible()
            self.navigationController?.pushViewController(viewController, animated: true)

        }
        
    }

}




