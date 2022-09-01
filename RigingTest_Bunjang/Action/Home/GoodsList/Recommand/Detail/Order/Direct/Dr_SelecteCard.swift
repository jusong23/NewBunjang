//
//  Dr_SelecteCard.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/27.
//

import UIKit

class Dr_SelecteCard: UIViewController {
    
    var Post_13_1 = post_13_1 ()
    var Get_13_2 = get_13_2_payments ()
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func postCardInfo(accountName:String) {
        Post_13_1.post_13_1_payment(accessToken: JwtToken.token ?? "", accountName: accountName, userIdx: User.Idx ?? "")
    }
    
    func getCardInfo() {
        Get_13_2.getPayments(accessToken: JwtToken.token ?? "", userIdx: User.Idx ?? "", onCompleted: {
            [weak self] result in // 순환 참조 방지, 전달인자로 result
            guard let self = self else { return } // 일시적으로 strong ref가 되게
     
            switch result {
            case let .success(result):
                
                print("----------------------------")
                print(result.baseResult.accountName)
                print("----------------------------")

            case let .failure(error):
                debugPrint("error \(error)")
            }
        })
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        getCardInfo()
    }
    
    @IBAction func card_1(_ sender: Any) {
        print("KB국민카드")
        postCardInfo(accountName: "KB국민카드")
        self.dismiss(animated: true)
        getCardInfo()
    }
    
    @IBAction func card_2(_ sender: Any) {
        print("신한카드")
        postCardInfo(accountName: "신한카드")
        self.dismiss(animated: true)
        getCardInfo()

    }
    
    @IBAction func card_3(_ sender: Any) {
        print("BC카드")
        postCardInfo(accountName: "BC카드")
        self.dismiss(animated: true)
    }
    
    @IBAction func card_4(_ sender: Any) {
        print("현대카드")
        postCardInfo(accountName: "현대카드")
        self.dismiss(animated: true)
        getCardInfo()

    }
    
    @IBAction func card_5(_ sender: Any) {
        print("삼성카드")
        postCardInfo(accountName: "삼성카드")
        self.dismiss(animated: true)
        getCardInfo()

    }
    
    @IBAction func card_6(_ sender: Any) {
        print("롯데카드")
        postCardInfo(accountName: "롯데카드")
        self.dismiss(animated: true)
        getCardInfo()

    }
    
    @IBAction func card_7(_ sender: Any) {
        print("NH카드")
        postCardInfo(accountName: "NH카드")
        self.dismiss(animated: true)
    }
    
    @IBAction func card_8(_ sender: Any) {
        print("하나카드")
        postCardInfo(accountName: "하나카드")
        self.dismiss(animated: true)
        getCardInfo()

    }
    
    @IBAction func card_9(_ sender: Any) {
        print("우리카드")
        postCardInfo(accountName: "우리카드")
        self.dismiss(animated: true)
        getCardInfo()

    }
    
    @IBAction func card_10(_ sender: Any) {
        print("씨티카드")
        postCardInfo(accountName: "씨티카드")
        self.dismiss(animated: true)
        getCardInfo()

    }
    
}

//User.ID

//JwtToken.token
