//
//  CardCollectionViewCell.swift
//  Plantity
//
//  Created by 김다연 on 2022/07/25.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var pushLogButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupAttribute()
    }

    func setupAttribute() {
        pushLogButton.layer.cornerRadius = 10
        pushLogButton.clipsToBounds = true
    }
}
