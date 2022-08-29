//
//  DealPage.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/26.
//

import UIKit

class DealPage: UIViewController {

    @IBOutlet var OrderView: UIView!
    @IBOutlet var DirectView: UIView!
    
    @IBOutlet var OrderCheck: UIButton!
    @IBOutlet var DirectCheck: UIButton!
    
    var typeCheck = 1
    var SELECTED_KEY: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let SELECTED_KEY = SELECTED_KEY {
            print("-----택배거래/직거래-------")
            print(SELECTED_KEY)
            print("------------")
        }
    }
    
    @IBAction func OrderDeal(_ sender: Any) {
        self.OrderView.borderColor = .mainRed
        self.OrderCheck.setImage(UIImage(systemName: "circle.circle.fill"), for: .normal)
        self.OrderCheck.tintColor = .mainRed

        self.DirectView.borderColor = .systemGray2
        self.DirectCheck.setImage(UIImage(systemName: "circle"), for: .normal)
        self.DirectCheck.tintColor = .systemGray2
        self.typeCheck = 1
    }
 
    @IBAction func DirectDeal(_ sender: Any) {
        self.DirectView.borderColor = .mainRed
        self.DirectCheck.setImage(UIImage(systemName: "circle.circle.fill"), for: .normal)
        self.DirectCheck.tintColor = .mainRed

        self.OrderView.borderColor = .systemGray2
        self.OrderCheck.setImage(UIImage(systemName: "circle"), for: .normal)
        self.OrderCheck.tintColor = .systemGray2
        self.typeCheck = 2
    }
    
    @IBAction func TapToDealPage(_ sender: Any) {
        if self.typeCheck == 1 {
            guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "OrderVC") as? OrderVC else {return}
                    viewController.modalPresentationStyle = .fullScreen
            viewController.SELECTED_KEY_ORDER = self.SELECTED_KEY
            DealType.Idx = 0
            self.present(viewController, animated: true, completion: nil)
        } else if self.typeCheck == 2 {
            guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "DirectVC") else {return}
                    viewController.modalPresentationStyle = .fullScreen
            DealType.Idx = 1
                    self.present(viewController, animated: true, completion: nil)
        }
    }
}
