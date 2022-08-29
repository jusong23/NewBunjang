//
//  OrderType.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/27.
//

import UIKit
import MaterialComponents

protocol SendCardName_Delegate: AnyObject {
    func send_Key(Key: String)
}

class OrderType: UIViewController {

    weak var delegate: SendCardName_Delegate?

    @IBOutlet var selectedCard: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func registerCard(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SelectCard") as! SelectCard
        let bottomSheet: MDCBottomSheetController = MDCBottomSheetController(contentViewController: vc)
        bottomSheet.mdc_bottomSheetPresentationController?.preferredSheetHeight = 600
        bottomSheet.scrimColor = UIColor.darkGray.withAlphaComponent(0.5)
        vc.delegate = self
        present(bottomSheet, animated: true, completion: nil)
    }
    
    @IBAction func tapBackButton(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func applyOrderType(_ sender: Any) {
        self.delegate?.send_Key(Key: self.selectedCard.text ?? "결제수단을 등록해주세요")
        self.dismiss(animated: true)
    }
    
}

extension OrderType: SendCardNameDelegate {
    func sendKey(Key: String) {
        self.selectedCard.text = Key
    }
}
