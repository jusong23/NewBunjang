//
//  AlarmVC.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/30.
//

import UIKit

class AlarmVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var section_1:[String] = ["아이폰 알림이 꺼져있습니다", "방해금지 시간 설정"]
    var section_2:[String] = ["메세지를 받았을 때"]
    var section_3:[String] = ["상품에 댓글이 달렸을 때", "상품이 찜 되었을 때", "내가 찜한 상품이 가격 하락 했을 때","UP하기 예약 실행 알림","재판매 가능 상품이 있을 때","내 상품으로 가격 제안 받을 때"]
    var section_4:[String] = ["상점에 댓글이 달렸을 때", "상점이 팔로우 되었을 때","상점 리뷰가 등록 되었을 때"]
    var section_5:[String] = ["배송진행", "배송이 완료되었을 때"]
    var section_6:[String] = ["이벤트 및 혜택 알림 동의"]
    var section_7:[String] = ["키워드 알림", "팔로잉 상점 알림","내가 찜한 상품으로 연락받기"]
    var section_8:[String] = ["우리동네 이벤트"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "AlarmCells", bundle: .main), forCellReuseIdentifier: "AlarmCells")
    }
    
    @IBAction func tapBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

    
extension AlarmVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        header.textLabel?.textColor = .black
    }

    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 8
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "알림"
        } else if section == 1 {
            return "번개톡 채팅 알림"
        } else if section == 2 {
            return "상품 알림"
        }  else if section == 3 {
            return "상점 알림"
        }  else if section == 4 {
            return "배송 알림"
        }  else if section == 5 {
            return "이벤트 및 혜택 알림"
        }  else if section == 6 {
            return "관심상품 알림"
        }  else {
            return "우리동네 알림"
        }
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return self.section_1.count ?? 0
        } else if section == 1 {
            return self.section_2.count ?? 0
        } else if section == 2 {
            return self.section_3.count ?? 0
        }  else if section == 3 {
            return self.section_4.count ?? 0
        }  else if section == 4 {
            return self.section_5.count ?? 0
        }  else if section == 5 {
            return self.section_6.count ?? 0
        }  else if section == 6 {
            return self.section_7.count ?? 0
        }  else {
            return self.section_8.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AlarmCells", for: indexPath) as? AlarmCells else { return UITableViewCell() }
        
        if indexPath.section == 0 {
            cell.label.text = self.section_1[indexPath.row]
            cell.Switch.isOn = false
            
            if indexPath.row == 0 {
                cell.label.textColor = .mainRed
            }
            
          } else if indexPath.section == 1 {
              cell.label.text = self.section_2[indexPath.row]
          } else if indexPath.section == 2 {
              cell.label.text = self.section_3[indexPath.row]
          }else if indexPath.section == 3 {
              cell.label.text = self.section_4[indexPath.row]
          } else if indexPath.section == 4 {
              cell.label.text = self.section_5[indexPath.row]
          } else if indexPath.section == 5 {
              cell.label.text = self.section_6[indexPath.row]
          } else if indexPath.section == 6 {
              cell.label.text = self.section_7[indexPath.row]
          } else if indexPath.section == 7 {
              cell.label.text = self.section_8[indexPath.row]
          }
 
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }


}
