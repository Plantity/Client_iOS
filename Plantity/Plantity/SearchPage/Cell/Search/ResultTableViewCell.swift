//
//  ResultTableViewCell.swift
//  Plantity
//
//  Created by 최은형 on 2022/07/25.
//

import UIKit

class ResultTableViewCell: UITableViewCell {
    @IBOutlet weak var resultImageView: UIImageView!
    
    @IBOutlet weak var resultNameLabel: UILabel!
    
    @IBOutlet weak var resultLvLabel: UILabel!
    
    @IBOutlet weak var resultIntroLabel: UILabel!
    
    @IBOutlet weak var resultTagLabel: UILabel!
    
    @IBOutlet weak var resultLikeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func actionIsResultLike(_ sender: UIButton) {
        if resultLikeButton.isSelected {
            resultLikeButton.isSelected = false
        } else {
            resultLikeButton.isSelected = true
        }
    }
    
    
}
