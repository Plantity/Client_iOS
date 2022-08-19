//
//  CardCollectionViewCell.swift
//  Plantity
//
//  Created by 김다연 on 2022/07/25.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    //식물로그보러가기버튼
    @IBOutlet weak var pushLogButton: UIButton!
    
    //식물이름
    @IBOutlet weak var plantNickname: UILabel!
    
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupAttribute()
    }

    func setupAttribute() {
        pushLogButton.layer.cornerRadius = 10
        pushLogButton.clipsToBounds = true
    }
    func setupCardData(imageUrl: String?, type: String?, nickname: String?, adoptDate: Date?){
        
        if let nicknameStr:String=nickname{
            plantNickname.text=nicknameStr
        }
        
        
    }
}
