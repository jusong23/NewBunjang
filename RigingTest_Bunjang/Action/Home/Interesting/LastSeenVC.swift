//
//  LastSeenVC.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/21.
//

import UIKit

class LastSeenVC: UIViewController {
    
    var GetSalesView = get_3_1_salesView ()
    var SalesViewModel = SalesViewListsDataModel ()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gettingSalesView()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: "SalesViewCells", bundle: nil), forCellWithReuseIdentifier: "SalesViewCells")
    }
    
    func gettingSalesView() {
        self.GetSalesView.getSalesView(accessToken: JwtToken.token, userIdx: User.Idx, onCompleted: {
            [weak self] result in // 순환 참조 방지, 전달인자로 result
            guard let self = self else { return } // 일시적으로 strong ref가 되게
     
            switch result {
            case let .success(result):
                
                for i in 0..<result.baseResult.count {
                    self.SalesViewModel.inputData(
                        itemIdx: result.baseResult[i].itemIdx,
                        itemName: result.baseResult[i].itemName,
                        cost: result.baseResult[i].cost,
                        isSafePayment: result.baseResult[i].isSafePayment,
                        uploadTime: result.baseResult[i].uploadTime,
                        imageUrl: result.baseResult[i].imageURL)
                }

                self.collectionView.reloadData()
                
            case let .failure(error):
                debugPrint("error \(error)")
            }
        })
    }
}

extension LastSeenVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.SalesViewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SalesViewCells", for: indexPath) as! SalesViewCells
        
        var cellItemName = self.SalesViewModel.getItemName(index: indexPath.row)
        var cellCost = self.SalesViewModel.getCost(index: indexPath.row)
        var cellIsSafe = self.SalesViewModel.getIsSafeTime(index: indexPath.row)
        var cellUploadTime = self.SalesViewModel.getUploadTime(index: indexPath.row)
        var cellImageUrl = self.SalesViewModel.getImageURL(index: indexPath.row)
//
        var url = URL(string: cellImageUrl ?? "")

        var fakeUrl = URL(string: "https://cdn1.domeggook.com/upload/item/2022/08/17/1660728672D2FC60FB94167B9A7FBEE4/1660728672D2FC60FB94167B9A7FBEE4_stt_150.png?hash=c816d722ffe0ddd7f0f464b7056047fc")
        
        cell.imageView?.load_3_1(url_3_1: (url ?? fakeUrl)!)
        
        cell.ItemName.text = cellItemName
        cell.ItemCost.text = cellCost
        cell.uploadTime.text = cellUploadTime
        
        if cellIsSafe == 0 {
            cell.isSafeMark.isHidden = true
        }
        
        cell.ItemName.sizeToFit()
        
        return cell
    }
    
}

extension UIImageView {
    func load_3_1(url_3_1: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url_3_1) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
