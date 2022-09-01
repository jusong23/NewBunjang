//
//  RegisterVC.swift
//  Pods
//
//  Created by 이주송 on 2022/08/22.
//

import UIKit

class RegisterVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
    }
    
    @IBAction func tapToCategoryButton(_ sender: Any) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "Rg_Category") else { return }
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
    }
    
    @IBAction func tapDismissButton(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapToTagButton(_ sender: Any) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "Rg_Tag") else { return }
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
    }
}

extension RegisterVC : RegisterTabBarControllerDelegate {
    func onTabSelected(isTheSame: Bool) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "RegisterVC") else {return}
               viewController.modalPresentationStyle = .fullScreen
               self.present(viewController, animated: true, completion: nil)
    }
}
