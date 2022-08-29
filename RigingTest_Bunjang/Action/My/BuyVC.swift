//
//  BuyVC.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/30.
//

import UIKit

class BuyVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var GetPurchase = get_12_4_purchase ()
    var purchaseDataModel = PurchaseListDataModel ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gettingPurchase()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "BuyCells", bundle: .main), forCellReuseIdentifier: "BuyCells")
    }

    func gettingPurchase() {
        self.GetPurchase.getPurchase(accessToken: JwtToken.token, onCompleted: {
            [weak self] result in // 순환 참조 방지, 전달인자로 result
            guard let self = self else { return } // 일시적으로 strong ref가 되게
     
            switch result {
            case let .success(result):
                
                for i in 0..<result.baseResult.count {
                    self.purchaseDataModel.inputData(
                        orderIdx: result.baseResult[i].orderIdx ?? 0,
                        itemName: result.baseResult[i].itemName ?? "",
                        itemCost: result.baseResult[i].itemCost ?? "",
                        itemUrl: result.baseResult[i].itemURL ?? "",
                        storeName: result.baseResult[i].storeName ?? "",
                        orderTime: result.baseResult[i].orderTime)
                }
                
                self.tableView.reloadData()

            case let .failure(error):
                debugPrint("error \(error)")
            }
        })
    }
}

extension BuyVC: UITableViewDataSource, UITableViewDelegate {


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.purchaseDataModel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "BuyCells", for: indexPath) as? BuyCells else { return UITableViewCell() }
        cell.ItemName.text = self.purchaseDataModel.getItemName(index: indexPath.row)
        cell.ItemCost.text = self.purchaseDataModel.getItemCost(index: indexPath.row)
        cell.OrderTime.text = self.purchaseDataModel.getOrderTime(index: indexPath.row)
    return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
    }


}
