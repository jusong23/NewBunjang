//
//  AddressCell.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/31.
//

import UIKit

class AddressCell: UITableViewCell {

    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var Address: UILabel!
    @IBOutlet weak var DetailAddress: UILabel!
    @IBOutlet weak var PhoneNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
