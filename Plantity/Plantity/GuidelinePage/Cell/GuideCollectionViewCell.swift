//
//  GuideCollectionViewCell.swift
//  Plantity
//
//  Created by 최은형 on 2022/07/28.
//

import UIKit

class GuideCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cardView: UIView!
    
    @IBOutlet weak var guideImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupAttribute()
    }

    func setupAttribute() {
        cardView.layer.cornerRadius = 10
        cardView.clipsToBounds = true
        
        guideImageView.layer.cornerRadius = 10
        guideImageView.clipsToBounds = true
    }
}
