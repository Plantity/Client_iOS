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
    
    func setupData(name: String?, level: Int?, intro: String?, tag: String?) {
        // setImage
        // guard let imageURLString = imageURLStr else { return }
        // if let url = URL(string: imageURLString) {
            //resultImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "photo")) }
        
        // setName
        if let nameStr: String = name {
            resultNameLabel.text = nameStr
        } else { return }
        
        // setLevel
        if let levelInt: Int = level {
            resultLvLabel.text = String(levelInt)
        } else { return }
        
        // setIntro
        if let introStr: String = intro {
            resultIntroLabel.text = introStr
        } else { return }
        
        // setTag
        if let tagStr: String = tag {
            resultTagLabel.text = tagStr
        } else { return }
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
