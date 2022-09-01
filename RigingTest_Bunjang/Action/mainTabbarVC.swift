//
//  mainTabbarVC.swift
//  Pods
//
//  Created by 이주송 on 2022/08/22.
//

import UIKit

protocol SearchTabBarControllerDelegate {
    func onTabSelected(isTheSame: Bool)
}

protocol RegisterTabBarControllerDelegate {
    func onTabSelected(isTheSame: Bool)
}

class mainTabbarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "OrderVC") as? OrderVC else {return}
        viewController.AlertDelegate = self
    }

    
    func presentModal() {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "SearchVC") else { return }
                    self.navigationController?.pushViewController(viewController, animated: true)
    }
}


extension mainTabbarVC : UITabBarControllerDelegate {
    
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        (viewController as? SearchTabBarControllerDelegate)?.onTabSelected(isTheSame: selectedViewController == viewController)
        (viewController as? RegisterTabBarControllerDelegate)?.onTabSelected(isTheSame: selectedViewController == viewController)

        var selectedIndex = tabBarController.viewControllers?.firstIndex(of: viewController)!
        if selectedIndex == 1 {
            return false
        } else if selectedIndex == 2 {
            return false
        }
        return true
    }
    
}

extension mainTabbarVC: AppearAlertDelegate {
    func onAlert() {
        print("it working")
        let alert = UIAlertController(title: "성공", message: " 결제가 완료되었습니다.", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "확인", style: .default) { (action) in }
        alert.addAction(okAction)
        self.present(alert, animated: false, completion: nil)
    }
}
