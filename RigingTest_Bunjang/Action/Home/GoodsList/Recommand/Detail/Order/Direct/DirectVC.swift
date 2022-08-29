//
//  DirectVC.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/27.
//

import UIKit

class DirectVC: UIViewController {

    var typeCheck = 2
    var SELECTED_KEY_ORDER: Int?
    
    @IBOutlet var quickDealCheck: UIButton!
    @IBOutlet var otherDealCheck: UIButton!
    @IBOutlet var personCheck: UIButton!
    
    @IBOutlet var COST: UILabel!
    @IBOutlet var NAME: UILabel!
    @IBOutlet var POINT: UILabel!
    @IBOutlet var COST_: UILabel!
    @IBOutlet var SAFEPAYCOST: UILabel!
    @IBOutlet var ORDERTIP: UILabel!
    @IBOutlet var TOTAL: UILabel!
    @IBOutlet var TOTAL_: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        print(RealSelectedKey)
    }
    
    @IBAction func registerOrderType(_ sender: Any) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "Dr_OrderType") else {return}
                viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
    }
}
