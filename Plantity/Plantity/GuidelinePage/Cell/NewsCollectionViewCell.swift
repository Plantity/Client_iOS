//
//  NewsCollectionViewCell.swift
//  Plantity
//
//  Created by 최은형 on 2022/07/28.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var newsImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupAttribute()
    }

    func setupAttribute() {
        newsImageView.layer.cornerRadius = 10
        newsImageView.clipsToBounds = true
    }
}
