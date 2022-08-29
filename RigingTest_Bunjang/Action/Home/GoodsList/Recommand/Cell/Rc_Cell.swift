//
//  Rc_Cell.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/22.
//

import UIKit

class Rc_Cell: UICollectionViewCell {
    
    var ItemListsDataModel = itemListsDataModel ()
    
    @IBOutlet var imageUrl: UIImageView!
    @IBOutlet var cost: UILabel!
    @IBOutlet var itemName: UILabel!
    @IBOutlet var address: UILabel!
    @IBOutlet var period: UILabel!
    @IBOutlet var heartButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func tapZzeamButton(_ sender: Any) {
        if self.heartButton.isSelected == false {
            self.heartButton.isSelected = true
            self.heartButton.tintColor = .mainRed
            self.heartButton.setImage(UIImage(systemName: "heart.fill"), for: .selected)
            // 찜 API에 보내고 0 -> 1
        } else {
            self.heartButton.isSelected = false
            self.heartButton.tintColor = .lightGray
            self.heartButton.setImage(UIImage(systemName: "heart"), for: .selected)
        }
    }
}
