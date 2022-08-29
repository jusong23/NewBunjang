//
//  BuyCells.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/30.
//

import UIKit

class BuyCells: UITableViewCell {

    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var ItemName: UILabel!
    @IBOutlet weak var ItemCost: UILabel!
    @IBOutlet weak var OrderTime: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
