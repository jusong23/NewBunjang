//
//  OrderVC.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/26.
//

import UIKit
import MaterialComponents

protocol returnToHomeDelegate: AnyObject {
    func onPop()
}

class OrderVC : UIViewController {
    
    var getOrderIndirect = get_12_1_order_indirect ()
    var postOrder = post_12_3 ()
    var typeCheck = 1
    var SELECTED_KEY_ORDER: Int?
    var delegate: returnToHomeDelegate?

    @IBOutlet var quickDealCheck: UIButton!
    @IBOutlet var otherDealCheck: UIButton!
    @IBOutlet var personCheck: UIButton!
    
    @IBOutlet var orderMemo: UILabel!
    @IBOutlet var userName: UILabel!
    @IBOutlet var address: UILabel!
    @IBOutlet var addressDetail: UILabel!
    @IBOutlet var userPhoneNumber: UILabel!
    
    @IBOutlet var COST: UILabel!
    @IBOutlet var NAME: UILabel!
    @IBOutlet var POINT: UILabel!
    @IBOutlet var COST_: UILabel!
    @IBOutlet var SAFEPAYCOST: UILabel!
    @IBOutlet var ORDERTIP: UILabel!
    @IBOutlet var TOTAL: UILabel!
    @IBOutlet var TOTAL_: UILabel!
    @IBOutlet var RegisteredCard: UILabel!
    @IBOutlet var RegisterLabel: UIButton!
    @IBOutlet weak var itemImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutSizeTofit()
    }
    
    func aboutSizeTofit() {
        self.NAME.sizeToFit()
    }
    
    @IBAction func tapXButton(_ sender: Any) {
        UserDefaults.standard.setValue(0, forKey: "SELECTED")
        self.presentingViewController?.dismiss(animated: true)
    }
    

    @IBAction func selectedPerson(_ sender: Any) {
        self.personCheck.tintColor = .mainRed
    }
    
    @IBAction func tapQuick(_ sender: Any) {
        self.quickDealCheck.setImage(UIImage(systemName: "circle.circle.fill"), for: .normal)
        self.quickDealCheck.tintColor = .mainRed
        
        self.otherDealCheck.setImage(UIImage(systemName: "circle"), for: .normal)
        self.otherDealCheck.tintColor = .systemGray2
        self.typeCheck = 1
    }
    
    @IBAction func tapOther(_ sender: Any) {
        self.otherDealCheck.setImage(UIImage(systemName: "circle.circle.fill"), for: .normal)
        self.otherDealCheck.tintColor = .mainRed

        self.quickDealCheck.setImage(UIImage(systemName: "circle"), for: .normal)
        self.quickDealCheck.tintColor = .systemGray2
        self.typeCheck = 2
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let SELECTED_KEY = SELECTED_KEY_ORDER {
            print("------------")
            print(SELECTED_KEY)
            print("------------")
            UserDefaults.standard.setValue(SELECTED_KEY, forKey: "selected")
            print(UserDefaults.standard.integer(forKey: "selected"))
        }
        
        // MARK: - 12. 1
        self.getOrderIndirect.getOrderIndirect(accessToken: JwtToken.token, itemIdx: self.SELECTED_KEY_ORDER ?? 999, onCompleted: {
            [weak self] result in // 순환 참조 방지, 전달인자로 result
            guard let self = self else { return } // 일시적으로 strong ref가 되게
    
            switch result {
            case let .success(result):
            
                var ItemCost = result.baseResult.itemCost
                var ItemName = result.baseResult.itemName
                var Point = result.baseResult.point
                var SafePayCost = result.baseResult.safePayCost
                var IsIncludeOrderTip = result.baseResult.isIncludeOrderTip
                var TotalCost = result.baseResult.totalCost
                var ImageURl = result.baseResult.itemImageURL
                
                self.COST.text = ItemCost
                self.COST_.text = ItemCost
                self.NAME.text = ItemName
                self.POINT.text = String(Point)
                self.SAFEPAYCOST.text = SafePayCost
                self.ORDERTIP.text = IsIncludeOrderTip
                self.TOTAL.text = TotalCost
                self.TOTAL_.text = TotalCost
                
                var url = URL(string: ImageURl ?? "")
                
                var fakeUrl = URL(string: "https://cdn1.domeggook.com/upload/item/2022/08/17/1660728672D2FC60FB94167B9A7FBEE4/1660728672D2FC60FB94167B9A7FBEE4_stt_150.png?hash=c816d722ffe0ddd7f0f464b7056047fc")
                
                self.itemImage.load_12_1(url_12_1: (url ?? fakeUrl)!)
                                                
            case let .failure(error):
                debugPrint("error \(error)")
            }
        })
    }
    
    
    @IBAction func registerOtherType(_ sender: Any) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "OrderType") as? OrderType else {return}
                viewController.modalPresentationStyle = .fullScreen
        viewController.delegate = self
        self.present(viewController, animated: true, completion: nil)
    }
    
    @IBAction func tapRegisterAddress(_ sender: Any) {
        // 바텀 시트로 쓰일 뷰컨트롤러 생성
        let vc = storyboard?.instantiateViewController(withIdentifier: "RegisterAddressVC") as! RegisterAddressVC
        let bottomSheet: MDCBottomSheetController = MDCBottomSheetController(contentViewController: vc)
        bottomSheet.mdc_bottomSheetPresentationController?.preferredSheetHeight = 175
        vc.delegate = self
        bottomSheet.scrimColor = UIColor.darkGray.withAlphaComponent(0.5)
        present(bottomSheet, animated: true, completion: nil)
    }
    
    @IBAction func tapOrderMemo(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "OrderMemoVC") as! OrderMemoVC
        let bottomSheet: MDCBottomSheetController = MDCBottomSheetController(contentViewController: vc)
        bottomSheet.mdc_bottomSheetPresentationController?.preferredSheetHeight = 310
        bottomSheet.scrimColor = UIColor.darkGray.withAlphaComponent(0.5)
        vc.delegate = self
        present(bottomSheet, animated: true, completion: nil)
    }
    
    @IBAction func register(_ sender: Any) {
        postOrder.post_12_3_payment(accessToken: JwtToken.token,
                                    addressIdx: Address_ST.Idx,
                                    itemIdx: Item.Idx ?? 9999,
                                    buyUserIdx: Int(User.Idx) ?? 9999,
                                    orderRequest: self.orderMemo.text ?? "요청사항 없음",
                                    isDirectDeal: DealType.Idx ?? 999,
                                    paymentIdx: Payment.Idx ?? 9999)
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
        self.Complete()

    }

    func Complete() {
        let alert = UIAlertController(title: "성공", message: " 결제가 완료되었습니다.", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "확인", style: .default) { (action) in }
        alert.addAction(okAction)
        present(alert, animated: false, completion: nil)
    }
    
}

extension OrderVC: SendDataDelegate {
    func sendData(name: String) {
            self.orderMemo.text = name
        }
}

extension OrderVC: SendAddressDelegate {
    func sendAddress(address: String, addressDetail: String, userName: String, userPhoneNumber: String) {
        self.address.text = address
        self.addressDetail.text = addressDetail
        self.userName.text = userName
        self.userPhoneNumber.text = userPhoneNumber
    }
}

extension OrderVC: SendCardName_Delegate {
    func send_Key(Key: String) {
        self.RegisteredCard.text = Key
        self.RegisterLabel.setTitle("변경", for: .normal)
        
        print("addressIdx는 :\(Address_ST.Idx)")
        print("itemIdx는 :\(Item.Idx)")
        print("buyUserIdx는 :\(User.Idx)")
        print("isDirectDeal는 :\(DealType.Idx)")
        print("orderRequest는 :\(self.orderMemo.text)")
        print("paymentIdx는 :\(Payment.Idx)")

    }
}

extension UIImageView {
    func load_12_1(url_12_1: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url_12_1) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}


