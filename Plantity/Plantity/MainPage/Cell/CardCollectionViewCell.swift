//
//  CardCollectionViewCell.swift
//  Plantity
//
//  Created by 김다연 on 2022/07/25.
//

import UIKit
import Kingfisher

class CardCollectionViewCell: UICollectionViewCell {
    //plusimage
    @IBOutlet weak var plusimage: UIImageView!
    
    //이미지
    @IBOutlet weak var plantimage: UIImageView!
    
    
    //식물로그보러가기버튼
//    @IBOutlet weak var pushLogButton: UIButton!
    
    //dday
    @IBOutlet weak var plantdate: UILabel!
    
    
    //식물이름
    @IBOutlet weak var plantNickname: UILabel!
    
    //todo버튼
    @IBOutlet weak var didwater: UIButton!
    @IBOutlet weak var didsoil: UIButton!
    @IBOutlet weak var didlook: UIButton!
    @IBOutlet weak var didshower: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupAttribute()
    }

    func setupAttribute() {
//        pushLogButton.layer.cornerRadius = 10
//        pushLogButton.clipsToBounds = true
    }

    func setupCardData(filePath: String?, plantName: String?, plantNickName: String?, myPlantId: String?){
        
        if let nicknameStr:String=plantNickName{
            plantNickname.text=nicknameStr
        }
        
        // 원래 adopt date였는데 바뀜!! ㅠㅠ
        if let adoptDateStr:String = myPlantId {
            plantdate.text=adoptDateStr
        }
        
        //url으로 imageurl 받는 방법 -> kingfisher 사용하기
        if let imageURL = URL(string:filePath!) {
            plantimage.kf.setImage(with: imageURL)
        }
        
//        if let imageUrlStr:String = imageUrl {
//            plantimage.image=imageUrlStr
//        }
      
        
        //마지막 카드는 항상 "plus"로 이름설정
        if plantName == "plus" && plantNickName == "plus"{
//            pushLogButton.isHidden=true
            plantNickname.isHidden=true
            didwater.isHidden=true
            didsoil.isHidden=true
            didlook.isHidden=true
            didshower.isHidden=true
            plantimage.isHidden=true
            plantdate.isHidden=true
            plusimage.isHidden=false
        
        }else{
//            pushLogButton.isHidden=false
            plantNickname.isHidden=false
            didwater.isHidden=false
            didsoil.isHidden=false
            didlook.isHidden=false
            didshower.isHidden=false
            plantimage.isHidden=false
            plantdate.isHidden=false
            plusimage.isHidden=false
            plusimage.isHidden=true
            
        }
        
        
    }
    
    
    @IBAction func didwaterClicked(_ sender: UIButton) { NotificationCenter.default.post(name: NSNotification.Name("didAssign"), object: "water")
    }
    
    @IBAction func didsoilClicked(_ sender: UIButton) { NotificationCenter.default.post(name: NSNotification.Name("didAssign"), object: "repot")
    }
    
    @IBAction func didlookClicked(_ sender: UIButton) { NotificationCenter.default.post(name: NSNotification.Name("didAssign"), object: "look")
    }
    
    @IBAction func didsunClicked(_ sender: UIButton) { NotificationCenter.default.post(name: NSNotification.Name("didAssign"), object: "sun")
    }
}
