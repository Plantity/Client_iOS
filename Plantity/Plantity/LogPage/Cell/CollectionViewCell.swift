//
//  CollectionViewCell.swift
//  Plantity
//
//  Created by 김다연 on 2022/07/26.
//

import UIKit
import Kingfisher

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
    //
    func setupCardData(filePath: String?, plantName: String?, plantNickName: String?, myPlantId: Int?,plantadapttime:String?){
        
        // 이미지
        //url으로 imageurl 받는 방법 -> kingfisher 사용하기
        if let imageURL = URL(string:filePath!) {
            plantImage.kf.setImage(with: imageURL)
        }
        
        // nickname
        if let nicknameStr:String=plantNickName{
            plantNickname.text=nicknameStr
        }
        
        
        //plantType
        // 원래 adopt date였는데 바뀜!! ㅠㅠ
        if let plantNamestr:String = plantName {
            plantType.text=plantNamestr
        }
        
        //plantLevel
        if let plantlevelstr:String = plantName {
            plantType.text="LEVEL 3"
        }
        
        //plantMemo
        if let plantadapttimestr:String = plantadapttime {
            plantMemo.text=plantadapttimestr
        }
        
        

        
        
    }
    //
    /* 안씀 예전꺼 = 지워도됨
    func setupCardData(image:String?,nickname:String?,type:String?,level:Int?,memo:String?){
        
//        if let plantImageImg:UIImage=image{
//            plantImage.image=plantImageImg
//        }
        
        if let plantNicknameStr:String=nickname{
            plantNickname.text=plantNicknameStr
        }
        
        if let plantTypeStr:String=type{
            plantType.text=plantTypeStr
        }
        
        //url으로 imageurl 받는 방법 -> kingfisher 사용하기
        if let imageURL = URL(string:image!) {
            plantImage.kf.setImage(with: imageURL)
        }

        
        if let plantMemoString:String=memo{
            plantMemo.text=plantMemoString
        }
        
    }
     */

}
