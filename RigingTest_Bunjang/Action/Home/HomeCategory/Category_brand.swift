//
//  Category_brand.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/21.
//

import UIKit

class Category_brand: UIViewController {

    var GetBrands = get_8_1_brands ()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gettingBrands()
    }

    func gettingBrands() {
        self.GetBrands.getBrands(accessToken: JwtToken.token, userIdx: User.Idx, onCompleted: {
            [weak self] result in // 순환 참조 방지, 전달인자로 result
            guard let self = self else { return } // 일시적으로 strong ref가 되게
        
            switch result {
            case let .success(result):
        
//                for i in 0..<result.baseResult.count {
//                    self.ChatRoomDataModel.inputData(
//                        storeImageUrl: result.baseResult[i].storeImageURL,
//                        storeName: result.baseResult[i].storeName,
//                        period: result.baseResult[i].period,
//                        lastChat: result.baseResult[i].lastChat)
//                    }
        
                self.tableView.reloadData()
                print(result.baseResult.count)
        
            case let .failure(error):
                debugPrint("error \(error)")
            }
        })
    }
}
