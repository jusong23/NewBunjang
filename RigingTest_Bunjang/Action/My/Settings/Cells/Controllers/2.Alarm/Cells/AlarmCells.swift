//
//  AlarmCells.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/30.
//

import UIKit

class AlarmCells: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var Switch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
