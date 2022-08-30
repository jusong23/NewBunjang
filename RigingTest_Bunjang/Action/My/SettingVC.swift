//
//  SettingVC.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/30.
//

import UIKit

class SettingVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var UserSetting:[String] = ["계정 설정","알림 설정","우리동네 지역 설정","배송지 설정","계좌 설정","간편결제 카드설정","차단 상점 관리"]
    var UserInfo:[String] = ["이용약관", "개인정보 처리방침","위치기반 서비스 이용약관","버전정보 8.10.1"]
    var UserName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "SettingCell", bundle: .main), forCellReuseIdentifier: "SettingCell")
        getUserName()
    }
    
    func getUserName() {
        if let USERNAME = UserName {
            print(USERNAME)
        }
    }
    @IBAction func tapBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension SettingVC: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        header.textLabel?.textColor = .black
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "사용자 설정        "
        } else if section == 1 {
            return "사용자 정보"
        } else {
            return " "
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            print("계정설정 ㄱ ㄱ")
        } else if indexPath.row == 1 {
            print("알림설정 ㄱ ㄱ")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return self.UserSetting.count
        } else if section == 1 {
            return self.UserInfo.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath) as? SettingCell else { return UITableViewCell() }
        
        if indexPath.section == 0 {
            cell.lable?.text = "\(self.UserSetting[indexPath.row])"
          } else if indexPath.section == 1 {
              cell.lable?.text = "\(self.UserInfo[indexPath.row])"
          } else {
              cell.lable?.text = "로그아웃 (" + (self.UserName ?? "") + ")"
          }

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }


}
