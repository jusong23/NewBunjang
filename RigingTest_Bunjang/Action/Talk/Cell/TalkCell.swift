//
//  TalkCell.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/22.
//

import UIKit

class TalkCell: UITableViewCell {

    @IBOutlet weak var StoreImage: UIImageView!
    @IBOutlet weak var StoreName: UILabel!
    @IBOutlet weak var LastChat: UILabel!
    @IBOutlet weak var Period: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.Period.sizeToFit()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
