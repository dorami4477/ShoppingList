//
//  ListCell.swift
//  240524_checklistHW
//
//  Created by 박다현 on 5/24/24.
//

import UIKit

class ListCell: UITableViewCell {

    @IBOutlet var checkButton: UIButton!
    @IBOutlet var listLabel: UILabel!
    @IBOutlet var starButton: UIButton!
    @IBOutlet var listBoxView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


}
