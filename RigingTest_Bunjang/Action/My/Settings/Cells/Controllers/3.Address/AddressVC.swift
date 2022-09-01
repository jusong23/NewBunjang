//
//  AddressVC.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/31.
//

import UIKit

class AddressVC: UIViewController {

    var getAddress = get_4_2_address ()
    var addressListDataModel = AddressListDataModel ()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var AddAddress: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "AddressCell", bundle: .main), forCellReuseIdentifier: "AddressCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        gettingAddress()
        self.tableView.reloadData()
    }
    
    @IBAction func tapToAdd(_ sender: Any) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "AddAddressVC") as? AddAddressVC else { return }
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func tapBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func gettingAddress() {
        self.getAddress.getAddress(accessToken: JwtToken.token ?? "", onCompleted: {
            [weak self] result in // 순환 참조 방지, 전달인자로 result
            guard let self = self else { return } // 일시적으로 strong ref가 되게
     
            switch result {
            case let .success(result):

                for i in 0..<result.baseResult.count {
                    self.addressListDataModel.inputData(
                        userName: result.baseResult[i].userName,
                        address: result.baseResult[i].address,
                        detailAddress: result.baseResult[i].detailAddress,
                        phoneNumber: result.baseResult[i].phoneNumber,
                        isBaseAddress: result.baseResult[i].isBaseAddress)
                }
                        
                self.tableView.reloadData()
                print(result.baseResult.count)
                
            case let .failure(error):
                debugPrint("error \(error)")
            }
        })
    }
}


extension AddressVC: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.addressListDataModel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AddressCell", for: indexPath) as? AddressCell else { return UITableViewCell() }

        var cellUserName = self.addressListDataModel.getUserName(index: indexPath.row)
        var cellAddress = self.addressListDataModel.getAddress(index: indexPath.row)
        var cellDetailAddress = self.addressListDataModel.getDetail(index: indexPath.row)
        var cellPhoneNumber = self.addressListDataModel.getPhoneNumber(index: indexPath.row)
        
        cell.UserName.text = cellUserName
        cell.Address.text = cellAddress
        cell.DetailAddress.text = cellDetailAddress
        cell.PhoneNumber.text = cellPhoneNumber
        
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

extension UIImageView {
    func load_1_5(url_1_5: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url_1_5) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}




