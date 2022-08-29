//
//  Dr_OrderType.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/27.
//

import UIKit
import MaterialComponents

class Dr_OrderType: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func otherCardType(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Dr_SelecteCard") as! Dr_SelecteCard
        let bottomSheet: MDCBottomSheetController = MDCBottomSheetController(contentViewController: vc)
        bottomSheet.mdc_bottomSheetPresentationController?.preferredSheetHeight = 600
        bottomSheet.scrimColor = UIColor.darkGray.withAlphaComponent(0.5)
        present(bottomSheet, animated: true, completion: nil)
    }
}
