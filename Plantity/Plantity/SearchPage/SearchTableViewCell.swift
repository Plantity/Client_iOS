//
//  SearchTableViewCell.swift
//  Plantity
//
//  Created by 최은형 on 2022/07/23.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    // MARK: - Properties
    @IBOutlet weak var todayPlantImageView: UIImageView!
    
    @IBOutlet weak var todayPlantLabel: UILabel!
    
    @IBOutlet weak var todayPlantInfoLabel: UILabel!
    
    @IBOutlet weak var likeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Action
    @IBAction func actionIsLike(_ sender: Any) {
        if likeButton.isSelected {
        likeButton.isSelected = false
        } else {
            likeButton.isSelected = true
        }
    }
    
    
    
}
