//
//  OrderMemo.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/26.
//

import UIKit

protocol SendDataDelegate: AnyObject {
    func sendData(name: String)
}

class OrderMemoVC: UIViewController {

    weak var delegate: SendDataDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func 문앞(_ sender: Any) {
        self.delegate?.sendData(name: "문앞")
        self.dismiss(animated: true)
    }
    
    @IBAction func 직받부문(_ sender: Any) {
        self.delegate?.sendData(name: "직접 받고 부재 시 문앞")
        self.dismiss(animated: true)
    }
    
    @IBAction func 경비실(_ sender: Any) {
        self.delegate?.sendData(name: "경비실")
        self.dismiss(animated: true)
    }
    
    @IBAction func 우편함(_ sender: Any) {
        self.delegate?.sendData(name: "우편함")
        self.dismiss(animated: true)
    }
    
    @IBAction func 직접입력(_ sender: Any) {
        self.delegate?.sendData(name: "직접입력")
        self.dismiss(animated: true)
    }
}
