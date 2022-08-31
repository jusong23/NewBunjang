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
