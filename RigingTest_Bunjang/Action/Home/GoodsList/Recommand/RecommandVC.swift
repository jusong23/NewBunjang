//
//  RecommandVC.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/21.
//

import UIKit

class RecommandVC: UIViewController {
    
    var ItemListsDataModel = itemListsDataModel ()
    let
    getItems = get_2_4_items()

    @IBOutlet var collectionView: UICollectionView!
    let layout = UICollectionViewFlowLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: "Rc_Cell", bundle: nil), forCellWithReuseIdentifier: "Rc_Cell")
        self.layout.minimumLineSpacing = 0
        appendItems()
    }
    
    
    func appendItems() {
        getItems.getItems(accessToken: JwtToken.token ?? "", onCompleted: {
            [weak self] result in // 순환 참조 방지, 전달인자로 result
            guard let self = self else { return } // 일시적으로 strong ref가 되게
     
            switch result {
            case let .success(result):
                
            for i in 0..<result.baseResult.count {
                self.ItemListsDataModel.inputData(
                      itemIdx: result.baseResult[i].itemIdx ?? 0,
                      cost: result.baseResult[i].cost ?? "",
                      itemName: result.baseResult[i].itemName ?? "",
                      address: result.baseResult[i].address ?? "",
                      period: result.baseResult[i].period ?? "",
                      imageURL: result.baseResult[i].imageURL ?? "",
                      isSafePayment: result.baseResult[i].isSafePayment ?? 0,
                      likeCnt: result.baseResult[i].likeCnt ?? 0)
            }
            
                self.collectionView.reloadData()
                
            case let .failure(error):
                debugPrint("error \(error)")
            }
        })
    }
}

extension RecommandVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.ItemListsDataModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        var cellItemIdx = self.ItemListsDataModel.getItemIdx(index: indexPath.row)
        var cellCost = self.ItemListsDataModel.getCost(index: indexPath.row)
        var cellItemName = self.ItemListsDataModel.getItemName(index: indexPath.row)
        var cellAddress = self.ItemListsDataModel.getAddress(index: indexPath.row)
        var cellPeriod = self.ItemListsDataModel.getPeriod(index: indexPath.row)
        var cellIsSafePayment = self.ItemListsDataModel.getIsSafePayment(index: indexPath.row)
        var cellLikeCnt = self.ItemListsDataModel.getLikeCnt(index: indexPath.row)
        var cellImageUrl = self.ItemListsDataModel.getImageURL(index: indexPath.row)
        
        UserDefaults.standard.setValue(cellItemIdx, forKey: "SELECTED")
        
        guard let ViewController = self.storyboard?.instantiateViewController(withIdentifier: "ItemDetails") as? ItemDetails else {return}
        ViewController.itemindex = cellItemIdx
        ViewController.cost = cellCost
        ViewController.itemName = cellItemName
        ViewController.address = cellAddress
        ViewController.period = cellPeriod
        ViewController.imageUrl = cellImageUrl
        
        self.navigationController?.pushViewController(ViewController, animated: true)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Rc_Cell", for: indexPath) as! Rc_Cell
        
        var cellImage = self.ItemListsDataModel.getImageURL(index: indexPath.row)
        var cellCost = self.ItemListsDataModel.getCost(index: indexPath.row)
        var cellItemName = self.ItemListsDataModel.getItemName(index: indexPath.row)
        var cellAddress = self.ItemListsDataModel.getAddress(index: indexPath.row)
        var cellPeriod = self.ItemListsDataModel.getPeriod(index: indexPath.row)
        var cellImageUrl = self.ItemListsDataModel.getImageURL(index: indexPath.row)
        var cellIsSafePayment = self.ItemListsDataModel.getIsSafePayment(index: indexPath.row)
        var cellLikeCnt = self.ItemListsDataModel.getLikeCnt(index: indexPath.row)
        
        var url = URL(string: cellImageUrl ?? "")
        
        var fakeUrl = URL(string: "https://cdn1.domeggook.com/upload/item/2022/08/17/1660728672D2FC60FB94167B9A7FBEE4/1660728672D2FC60FB94167B9A7FBEE4_stt_150.png?hash=c816d722ffe0ddd7f0f464b7056047fc")
        
        cell.imageUrl?.load_2_4(url_2_4: (url ?? fakeUrl)!)
        cell.cost.text = String(cellCost)
        cell.itemName.text = String(cellItemName)
        cell.address.text = cellAddress
        cell.period.text = cellPeriod
        
        
        if cellIsSafePayment == 0 {
//            cell.safePatmentView.isHidden = true
            cell.imageHeight.constant = 0
        }
        
        if cellLikeCnt == 0 {
            cell.likeCount.isHidden = true
            cell.heartImage.isHidden = true
        } else {
            cell.likeCount.text = String(cellLikeCnt)
        }
        
        cell.itemName.sizeToFit()
        
        return cell
    }
    
}

extension UIImageView {
    func load_2_4(url_2_4: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url_2_4) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
