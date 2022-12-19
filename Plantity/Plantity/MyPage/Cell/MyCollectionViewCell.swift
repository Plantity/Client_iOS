//
//  MyCollectionViewCell.swift
//  Plantity
//
//  Created by 최은형 on 2022/07/26.
//

import UIKit
import Kingfisher

class MyCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    public func configure(with data: String?) {
        if let imageUrl: URL = URL(string: data ?? "") {
            print("이미지: ", imageUrl)
            imageView.kf.setImage(with: imageUrl)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupAttribute()
    }

    public func setupAttribute() {
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
    }
}
