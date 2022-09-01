//
//  ContentViewController.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/23.
//

import UIKit

protocol modalOtherLoginPresentDelegate: AnyObject {
    func onModal()
}

class ContentViewController: UIViewController {
    
    weak var delegate: modalOtherLoginPresentDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func tapSiginWithBirth(_ sender: Any) {
        self.dismiss(animated: true)
        self.delegate?.onModal()
    }
    
}

