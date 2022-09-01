//
//  ItemDetails.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/24.
//

import UIKit
import MaterialComponents


class ItemDetails: UIViewController {

    let getItemsIdx = get_2_6_item_itemIdx()
    let Post_5_2 = post_5_2 ()
    
    var itemindex: Int?
    var cost: String?
    var itemName: String?
    var address: String?
    var period: String?
    var likeCnt: String?
    var imageUrl: String?
    
    var selectedKey = UserDefaults.standard.integer(forKey: "SELECTED")

    @IBOutlet var RC_cost: UILabel!
    @IBOutlet var RC_itemName: UILabel!
    @IBOutlet var RC_address: UILabel!
    @IBOutlet var RC_period: UILabel!
    @IBOutlet var RC_viewCount: UILabel!
    @IBOutlet var RC_likeCount: UILabel!
    @IBOutlet var RC_chatCount: UILabel!
    @IBOutlet var RC_isUsed: UIButton!
    @IBOutlet var RC_itemCount: UIButton!
    @IBOutlet var RC_isIncludeOrderTip: UIButton!
    @IBOutlet var RC_isCanExchage: UIButton!
    @IBOutlet var RC_itemContent: UILabel!
    @IBOutlet weak var RC_image: UIImageView!
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var SafePay: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        bindingData()

        
        self.RC_itemName.sizeToFit()
        self.RC_itemContent.sizeToFit()
        
        // MARK: - [GET] 2.6 상품 목록 가져오기(최신순) /items/:itemIdx
        self.getItemsIdx.getItemsIdx(accessToken: JwtToken.token ?? "", itemIdx: self.selectedKey, userIdx: User.Idx ?? "", onCompleted: {
            [weak self] result in // 순환 참조 방지, 전달인자로 result
            guard let self = self else { return } // 일시적으로 strong ref가 되게
     
            switch result {
            case let .success(result):
                
                self.RC_viewCount.text = String(result.baseResult.viewCount)
                self.RC_likeCount.text = String(result.baseResult.likeCount)
                self.RC_chatCount.text = String(result.baseResult.chatCount)
                
                if result.baseResult.isUsed == 1 {
                    self.RC_isUsed.setTitle("중고상품", for: .normal)
                } else {
                    self.RC_isUsed.setTitle("신상품", for: .normal)
                }
                
                self.RC_itemCount.setTitle(result.baseResult.itemCount, for: .normal)
               
                if result.baseResult.isIncludeOrderTip == 1 {
                    self.RC_isIncludeOrderTip.setTitle("배송비포함", for: .normal)
                } else {
                    self.RC_isIncludeOrderTip.setTitle("배송비제외", for: .normal)
                }
                
                if result.baseResult.isCanExchange == 1 {
                    self.RC_isCanExchage.setTitle("교환불가", for: .normal)
                } else {
                    self.RC_isCanExchage.setTitle("교환가능", for: .normal)
                }
                
                if result.baseResult.isSafePayment == 0 {
                    self.SafePay.isHidden = true
                }
                
                self.RC_itemContent.text = result.baseResult.itemContent

                if result.baseResult.tagList.isEmpty == false {
//                    for i in 0..<result.baseResult.tagList.count {
//                        print(result.baseResult.tagList[i])
//                    }
                    print("배열 있음")
                }
                

            case let .failure(error):
                debugPrint("error \(error)")
            }
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "OrderVC") as! OrderVC
        vc.delegate = self
        print("OrderVC delegate위임")
    }
    
    @IBAction func tapToDealPage(_ sender: Any) {
        // 바텀 시트로 쓰일 뷰컨트롤러 생성
        let vc = storyboard?.instantiateViewController(withIdentifier: "DealPage") as! DealPage
        let bottomSheet: MDCBottomSheetController = MDCBottomSheetController(contentViewController: vc)
        bottomSheet.mdc_bottomSheetPresentationController?.preferredSheetHeight = 490
        bottomSheet.scrimColor = UIColor.darkGray.withAlphaComponent(0.5)
        vc.SELECTED_KEY = self.itemindex
        present(bottomSheet, animated: true, completion: nil)
    }
    
    // MARK: - [GET] 2.4 상품 목록 가져오기(최신순) /items
    func bindingData() {
        if let itemindex = itemindex,
            let cost = cost,
            let itemName = itemName,
            let address = address,
            let period = period,
            let imageUrl = imageUrl {
            print("idx: \(self.itemindex)")
            self.RC_cost.text = self.cost
            self.RC_itemName.text = self.itemName
            self.RC_address.text = self.address
            self.RC_period.text = self.period
            
            var cellImageUrl = imageUrl
            var url = URL(string: cellImageUrl ?? "")
            
            var fakeUrl = URL(string: "https://cdn1.domeggook.com/upload/item/2022/08/17/1660728672D2FC60FB94167B9A7FBEE4/1660728672D2FC60FB94167B9A7FBEE4_stt_150.png?hash=c816d722ffe0ddd7f0f464b7056047fc")
            
            self.RC_image.load_2_6(url_2_6: (url ?? fakeUrl)!)
                        
            UserDefaults.standard.setValue(itemindex, forKey: "RealSelectedKey")
            Item.Idx = itemindex
        }
    }
    
    @IBAction func tapBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tapZzeamButton(_ sender: Any) {
        self.heartButton.isSelected = true
        self.heartButton.tintColor = .mainRed
        self.heartButton.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        
        self.Post_5_2.post_5_2_lies(accessToken: JwtToken.token ?? "", userIdx: User.Idx ?? "", itemIdx: Int(Item.Idx ?? 0))
    }
    
    
}

extension ItemDetails: returnToHomeDelegate {
    func onPop() {
        print("it`s working")
    }
}

extension UIImageView {
    func load_2_6(url_2_6: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url_2_6) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}


