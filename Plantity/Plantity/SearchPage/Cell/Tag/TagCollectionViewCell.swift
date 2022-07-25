//
//  TagCollectionViewCell.swift
//  Plantity
//
//  Created by 최은형 on 2022/07/23.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var tagImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupAttribute()
    }

    func setupAttribute() {
        tagImageView.layer.cornerRadius = 71 / 2
        tagImageView.clipsToBounds = true
    }
}
