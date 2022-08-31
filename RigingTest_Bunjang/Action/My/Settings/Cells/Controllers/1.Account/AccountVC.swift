//
//  AccountVC.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/30.
//

import UIKit

class AccountVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var UserSetting:[String] = ["성별","생년월일"]
    var UserName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "AccountCells", bundle: .main), forCellReuseIdentifier: "AccountCells")
    }
    
    @IBAction func tapBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}

extension AccountVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return " "
        } else if section == 1 {
            return " "
        } else if section == 2 {
            return " "
        } else {
            return " "
        }
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return self.UserSetting.count
        } else if section == 1 {
            return 1
        } else if section == 2 {
            return 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AccountCells", for: indexPath) as? AccountCells else { return UITableViewCell() }
        
        if indexPath.section == 0 {
            cell.label?.text = "\(self.UserSetting[indexPath.row])"
            if indexPath.row == 1 {
                cell.subLabel.isHidden = false
                cell.subLabel.text = "19990327"
            }
          } else if indexPath.section == 1 {
              cell.label?.text = "연락처"
              cell.subLabel.isHidden = false
              cell.subLabel.text = "010-****-0949"
          } else if indexPath.section == 2 {
              cell.label?.text = "SNS 연동"
              cell.snsImage.isHidden = false
          } else {
              cell.label?.text = "탈퇴하기"
          }
 
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }


}
