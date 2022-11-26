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
    
    @IBOutlet weak var guideTitleLabel: UILabel!
    
    @IBOutlet weak var guideSubtitleLabel: UILabel!
    
    var guideData: GuideModelResult = GuideModelResult(title: "", subtitle: "", content: [], image: "")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupAttribute()
        setupData(title: guideData.title, subtitle: guideData.subtitle, image: guideData.image)
    }

    func setupAttribute() {
        cardView.layer.cornerRadius = 10
        cardView.clipsToBounds = true
        
        guideImageView.layer.cornerRadius = 10
        guideImageView.clipsToBounds = true
    }
    
    func setupData(title: String?, subtitle: String?, image: String?) {
        // guideImageView.image
        if let titleStr: String = title {
            guideTitleLabel.text = titleStr
        }
        if let subtitleStr:String = subtitle {
            guideSubtitleLabel.text = subtitleStr
        }
        
        if let imageStr:String = image {
            guideImageView.image = UIImage(named: imageStr)
        }
    }
}
