//
//  SalesViewCells.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/31.
//

import UIKit

class SalesViewCells: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var ItemName: UILabel!
    @IBOutlet weak var ItemCost: UILabel!
    @IBOutlet weak var uploadTime: UILabel!
    @IBOutlet weak var isSafeMark: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.uploadTime.sizeToFit()
    }

}
