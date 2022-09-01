//
//  MyVC.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/28.
//

import UIKit

class MyVC: UIViewController {

    var getUserInfo = get_1_5_UserInfo ()
    var GetLikes = get_5_1_likes ()

    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var NumberOfZzeam: UILabel!
    @IBOutlet weak var userImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        getitngUserInfo()
        gettingLikes()
    }
    
    func gettingLikes() {
        self.GetLikes.getLikes(accessToken: JwtToken.token ?? "", userIdx: User.Idx ?? "", onCompleted: {
            [weak self] result in // 순환 참조 방지, 전달인자로 result
            guard let self = self else { return } // 일시적으로 strong ref가 되게
     
            switch result {
            case let .success(result):
                                
                self.NumberOfZzeam.text = String(result.baseResult.count)
                
            case let .failure(error):
                debugPrint("error \(error)")
            }
        })
    }
    
    
    func getitngUserInfo() {
        self.getUserInfo.getUserInfo(accessToken: JwtToken.token ?? "", userIdx: User.Idx ?? "", onCompleted: {
            [weak self] result in // 순환 참조 방지, 전달인자로 result
            guard let self = self else { return } // 일시적으로 strong ref가 되게
     
            switch result {
            case let .success(result):
          
                self.UserName.text = result.baseResult.getUserRes.userName
                var ImageUrl = result.baseResult.getUserRes.profileImgURL
                
                var url = URL(string: ImageUrl ?? "")
                
                var fakeUrl = URL(string: "https://cdn1.domeggook.com/upload/item/2022/08/17/1660728672D2FC60FB94167B9A7FBEE4/1660728672D2FC60FB94167B9A7FBEE4_stt_150.png?hash=c816d722ffe0ddd7f0f464b7056047fc")
                
                self.userImage.load_1_5(url_1_5: (url ?? fakeUrl)!)
            
                
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

