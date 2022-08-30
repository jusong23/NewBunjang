//
//  MyVC.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/28.
//

import UIKit

class MyVC: UIViewController {

    var getUserInfo = get_1_5_UserInfo ()
    
    @IBOutlet weak var UserName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getitngUserInfo()
    }
    
    func getitngUserInfo() {
        self.getUserInfo.getUserInfo(accessToken: JwtToken.token, userIdx: User.Idx, onCompleted: {
            [weak self] result in // 순환 참조 방지, 전달인자로 result
            guard let self = self else { return } // 일시적으로 strong ref가 되게
     
            switch result {
            case let .success(result):
          
                self.UserName.text = result.baseResult.getUserRes.userName
                
            case let .failure(error):
                debugPrint("error \(error)")
            }
        })
    }
    
    @IBAction func tapSetting(_ sender: Any) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "SettingVC") as? SettingVC else { return }
        viewController.UserName = self.UserName.text
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func tapRegister(_ sender: Any) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "RecordsTabman") else { return }
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
