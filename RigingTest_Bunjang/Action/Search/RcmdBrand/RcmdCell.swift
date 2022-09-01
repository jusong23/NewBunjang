//
//  RcmdCell.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/21.
//

import UIKit

class RcmdCell: UITableViewCell {

    @IBOutlet weak var brandImage: UIImageView!
    
    @IBOutlet weak var brandName: UILabel!
    @IBOutlet weak var brandSubName: UILabel!
    @IBOutlet weak var brandItemCnt: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
