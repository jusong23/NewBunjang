//
//  ZzeamVC.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/21.
//

import UIKit

class ZzeamVC: UIViewController {

    var GetLikes = get_5_1_likes ()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gettingLikes()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: "ZzeamCell", bundle: nil), forCellWithReuseIdentifier: "ZzeamCell")
    }
    
    func gettingLikes() {
        self.GetLikes.getLikes(accessToken: JwtToken.token, userIdx: User.Idx, onCompleted: {
            [weak self] result in // 순환 참조 방지, 전달인자로 result
            guard let self = self else { return } // 일시적으로 strong ref가 되게
     
            switch result {
            case let .success(result):
                
            print(result)
                
            case let .failure(error):
                debugPrint("error \(error)")
            }
        })
    }
    
}

extension ZzeamVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

//        var cellItemIdx = self.ItemListsDataModel.getItemIdx(index: indexPath.row)
//        var cellCost = self.ItemListsDataModel.getCost(index: indexPath.row)
//        var cellItemName = self.ItemListsDataModel.getItemName(index: indexPath.row)
//        var cellAddress = self.ItemListsDataModel.getAddress(index: indexPath.row)
//        var cellPeriod = self.ItemListsDataModel.getPeriod(index: indexPath.row)
//        var cellIsSafePayment = self.ItemListsDataModel.getIsSafePayment(index: indexPath.row)
//        var cellLikeCnt = self.ItemListsDataModel.getLikeCnt(index: indexPath.row)
//        var cellImageUrl = self.ItemListsDataModel.getImageURL(index: indexPath.row)
//
        
//        guard let ViewController = self.storyboard?.instantiateViewController(withIdentifier: "ItemDetails") as? ItemDetails else {return}
//        ViewController.itemindex = cellItemIdx
//        ViewController.cost = cellCost
//        ViewController.itemName = cellItemName
//        ViewController.address = cellAddress
//        ViewController.period = cellPeriod
//        ViewController.imageUrl = cellImageUrl
//
//        self.navigationController?.pushViewController(ViewController, animated: true)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ZzeamCell", for: indexPath) as! ZzeamCell
        
//        var cellImage = self.ItemListsDataModel.getImageURL(index: indexPath.row)
//        var cellCost = self.ItemListsDataModel.getCost(index: indexPath.row)
//        var cellItemName = self.ItemListsDataModel.getItemName(index: indexPath.row)
//        var cellAddress = self.ItemListsDataModel.getAddress(index: indexPath.row)
//        var cellPeriod = self.ItemListsDataModel.getPeriod(index: indexPath.row)
//        var cellImageUrl = self.ItemListsDataModel.getImageURL(index: indexPath.row)
//        var cellIsSafePayment = self.ItemListsDataModel.getIsSafePayment(index: indexPath.row)
//        var cellLikeCnt = self.ItemListsDataModel.getLikeCnt(index: indexPath.row)
//
//        var url = URL(string: cellImageUrl ?? "")
//
//        var fakeUrl = URL(string: "https://cdn1.domeggook.com/upload/item/2022/08/17/1660728672D2FC60FB94167B9A7FBEE4/1660728672D2FC60FB94167B9A7FBEE4_stt_150.png?hash=c816d722ffe0ddd7f0f464b7056047fc")
        
//        cell.imageUrl?.load_2_4(url_2_4: (url ?? fakeUrl)!)
//        cell.cost.text = String(cellCost)
//        cell.itemName.text = String(cellItemName)
//        cell.address.text = cellAddress
//        cell.period.text = cellPeriod
        
        cell.itemName.sizeToFit()
        
        return cell
    }
    
}
