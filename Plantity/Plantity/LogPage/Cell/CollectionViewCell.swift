//
//  CollectionViewCell.swift
//  Plantity
//
//  Created by 김다연 on 2022/07/26.
//

import UIKit

class
CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var uiView: UIView!
    
    //xib 로 빼달라고 해서 여기에 카드 요소들 추가
    
    @IBOutlet weak var plantImage: UIImageView!
    @IBOutlet weak var plantNickname: UILabel!
    @IBOutlet weak var plantType: UILabel!
    @IBOutlet weak var plantLevel: UIImageView!
    @IBOutlet weak var plantMemo: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        
    }
    func setupcard() {
        uiView.layer.cornerRadius = 10
        uiView.clipsToBounds = true
    }

}
