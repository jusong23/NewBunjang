//
//  SelectCard.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/27.
//

import UIKit

protocol SendCardNameDelegate: AnyObject {
    func sendKey(Key: String)
}

class SelectCard: UIViewController {
    
    var Post_13_1 = post_13_1 ()
    weak var delegate: SendCardNameDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func postCardInfo(accountName:String) {
        Post_13_1.post_13_1_payment(accessToken: JwtToken.token, accountName: accountName, userIdx: User.Idx)
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    @IBAction func card_1(_ sender: Any) {
        postCardInfo(accountName: "KB국민카드")
        self.delegate?.sendKey(Key: "KB국민카드")
        self.dismiss(animated: true)
    }
    
    @IBAction func card_2(_ sender: Any) {
        postCardInfo(accountName: "신한카드")
        self.delegate?.sendKey(Key: "신한카드")
        self.dismiss(animated: true)
    }
    
    @IBAction func card_3(_ sender: Any) {
        postCardInfo(accountName: "BC카드")
        self.delegate?.sendKey(Key: "BC카드")
        self.dismiss(animated: true)
    }
    
    @IBAction func card_4(_ sender: Any) {
        postCardInfo(accountName: "현대카드")
        self.delegate?.sendKey(Key: "현대카드")
        self.dismiss(animated: true)
    }
    
    @IBAction func card_5(_ sender: Any) {
        postCardInfo(accountName: "삼성카드")
        self.delegate?.sendKey(Key: "삼성카드")
        self.dismiss(animated: true)
    }
    
    @IBAction func card_6(_ sender: Any) {
        postCardInfo(accountName: "롯데카드")
        self.delegate?.sendKey(Key: "롯데카드")
        self.dismiss(animated: true)
    }
    
    @IBAction func card_7(_ sender: Any) {
        postCardInfo(accountName: "NH카드")
        self.delegate?.sendKey(Key: "NH카드")
        self.dismiss(animated: true)
    }
    
    @IBAction func card_8(_ sender: Any) {
        postCardInfo(accountName: "하나카드")
        self.delegate?.sendKey(Key: "하나카드")
        self.dismiss(animated: true)
    }
    
    @IBAction func card_9(_ sender: Any) {
        postCardInfo(accountName: "우리카드")
        self.delegate?.sendKey(Key: "우리카드")
        self.dismiss(animated: true)
    }
    
    @IBAction func card_10(_ sender: Any) {

        postCardInfo(accountName: "씨티카드")
        self.delegate?.sendKey(Key: "씨티카드")
        self.dismiss(animated: true)
    }
}
