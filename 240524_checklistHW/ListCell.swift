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
        configureUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureUI(){
        listBoxView.backgroundColor = UIColor(red: 0.92, green: 0.92, blue: 0.92, alpha: 1.00)
        listBoxView.layer.cornerRadius = 10
        checkButton.tintColor = .black
        starButton.tintColor = .black
        starButton.backgroundColor = .clear
    }
    
    func configureData(row:ShoppingList){
        listLabel.text = row.list
        
        let check = row.complete ? "checkmark.square.fill" : "checkmark.square"
        checkButton.setImage(UIImage(systemName: check), for: .normal)

        if row.complete{
            let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: listLabel.text!)
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSRange(location: 0, length: attributeString.length))
            listLabel.attributedText = attributeString
        }else{
            let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: listLabel.text!)
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 0, range: NSRange(location: 0, length: attributeString.length))
            listLabel.attributedText = attributeString
        }
        
        let fav = row.important ? "star.fill" : "star"
        starButton.setImage(UIImage(systemName: fav), for: .normal)
    }

}
