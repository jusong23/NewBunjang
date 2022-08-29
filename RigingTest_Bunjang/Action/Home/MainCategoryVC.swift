//
//  MainCategoryVC.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/21.
//

import UIKit

class MainCategoryVC: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @IBAction func tapExitButton(_ sender: Any) {
        UserDefaults.standard.setValue(0, forKey: "WholeMenuKey")
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
