//
//  AccountCells.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/30.
//

import UIKit

class AccountCells: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    @IBOutlet weak var snsImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.subLabel.sizeToFit()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
