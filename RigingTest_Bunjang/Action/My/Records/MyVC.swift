//
//  MyVC.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/28.
//

import UIKit

class MyVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapToRecord(_ sender: Any) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "RecordsTabman") else { return }
                   self.navigationController?.pushViewController(viewController, animated: true)
    }
}
