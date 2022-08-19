//
//  AppendCollectionViewCell.swift
//  Plantity
//
//  Created by 김다연 on 2022/08/19.
//

import UIKit

class AppendCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cardAppend: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setupcard() {
        cardAppend.layer.cornerRadius = 10
        cardAppend.clipsToBounds = true
    }

}
