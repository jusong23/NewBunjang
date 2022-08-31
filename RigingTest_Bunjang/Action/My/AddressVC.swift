//
//  AddressVC.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/31.
//

import UIKit

class AddressVC: UIViewController {

    var getAddress = get_4_2_address ()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var AddAddress: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "AddressCell", bundle: .main), forCellReuseIdentifier: "AddressCell")
        gettingAddress()
    }
    
    func gettingAddress() {
        self.getAddress.getAddress(accessToken: JwtToken.token, onCompleted: {
            [weak self] result in // 순환 참조 방지, 전달인자로 result
            guard let self = self else { return } // 일시적으로 strong ref가 되게
     
            switch result {
            case let .success(result):

            print(result)
                
            case let .failure(error):
                debugPrint("error \(error)")
            }
        })
    }
}


extension AddressVC: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AddressCell", for: indexPath) as? AddressCell else { return UITableViewCell() }

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
}


}
