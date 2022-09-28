//
//  ResultViewController.swift
//  Plantity
//
//  Created by 최은형 on 2022/08/07.
//

import UIKit

class PlantViewController: UIViewController {
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var plantImageView: UIImageView!
    @IBOutlet weak var plantName: UILabel!
    @IBOutlet weak var plantLevel: UILabel!
    @IBOutlet weak var plantIntro: UILabel!
    
    @IBOutlet weak var wsBackground: UIView!
    @IBOutlet weak var plantWater: UILabel!
    @IBOutlet weak var plantSun: UILabel!
    
    @IBOutlet weak var officialNameLabel: UILabel!
    @IBOutlet weak var engNameLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var floweringLabel: UILabel!
    @IBOutlet weak var flowerColorLabel: UILabel!
    @IBOutlet weak var flowerLangLabel: UILabel!
    
    var searchPlant: SearchPlantModel = SearchPlantModel(plantIdx: 0, cntntsNo: "", cntntsSj: "", plntbneNm: "", plntzrNm: "", adviseInfo: "", orgplceInfo: "", lighttdemanddoCodeNm: "", ignSeasonCodeNm: "", flclrCodeNm: "", watercycleSprngCodeNm: "", managelevelCode: "")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupAttribute()
        setupData(plant: searchPlant)
    }
    
    func setupAttribute() {
        wsBackground.clipsToBounds = true
        wsBackground.layer.cornerRadius = 20
        
        addButton.clipsToBounds = true
        addButton.layer.cornerRadius = 10
    }
    
    func setupData(plant: SearchPlantModel?) {
//        if let isLike:Bool = isUserLike {
//            likeButton.isSelected = isLike
//        } else {return}
        
        // set image
        
        if let plantData: SearchPlantModel = plant {
            // set Name
            plantName.text =  plantData.cntntsSj
            
            // set Lv
            switch plantData.managelevelCode {
            case "089001":
                plantLevel.text = "⭐️"
            case "089002":
                plantLevel.text = "⭐️⭐️"
            case "089003":
                plantLevel.text = "⭐️⭐️⭐️"
            default:
                plantLevel.text = ""
            }
            
            // set Introduction
            plantIntro.text =  plantData.adviseInfo
            
            /** 물주기 멘트
             * 축축 -> 항상 축축하게 흙을 유지해주세요.
             * 촉촉 -> 물을 3일에 한 번씩 흙이 마르면 주세요.
             * 표면 -> 물을 7일에 한 번씩 표면이 마르면 주세요.
             * 대부분 -> 흙이 바싹 말랐을 때 조금씩 주세요.
             */
            let waterStr = plantData.watercycleSprngCodeNm
            if waterStr.contains("축축"){
                plantWater.text = "항상 축축하게 흙을 유지해주세요."
            } else if waterStr.contains("촉촉"){
                plantWater.text = "물을 3일에 한 번씩 흙이 마르면 주세요."
            } else if waterStr.contains("표면"){
                plantWater.text = "물을 7일에 한 번씩 표면이 마르면 주세요."
            } else if waterStr.contains("대부분"){
                plantWater.text = "흙이 바싹 말랐을 때 조금씩 주세요."
            } else{
                plantWater.text = "식물 상태를 살펴보면서 주세요."
            }
            
            /** 광도 멘트
             * 낮은 -> 햇빛이 적은 것을 좋아해요.
             * 중간 -> 햇빛이 적당한 것을 좋아해요.
             * 높은 -> 햇빛을 매우 좋아해요.
             */
            let lightStr = plantData.lighttdemanddoCodeNm
            if lightStr.contains("낮은"){
                plantSun.text = "햇빛이 적은 것을 좋아해요."
            } else if lightStr.contains("높은"){
                plantSun.text = "햇빛을 매우 좋아해요."
            } else{
                plantSun.text = "햇빛이 적당한 것을 좋아해요."
            }
            
            // set details
            officialNameLabel.text = "학명 : " + plantData.plntbneNm
            engNameLabel.text = "영문명 : " + plantData.plntzrNm
            originLabel.text = "원산지 : " + plantData.orgplceInfo
            floweringLabel.text = "개화시기 : " + plantData.ignSeasonCodeNm
            flowerColorLabel.text = "꽃 색 : " + plantData.flclrCodeNm
        }
    }
    
    @IBAction func backButtonClicked(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func LikeButtonClicked(_ sender: UIButton) {
        if likeButton.isSelected {
            likeButton.isSelected = false
        } else {
            likeButton.isSelected = true
        }
        //searchPlant.isUserLiked = likeButton.isSelected
    }
    
    @IBAction func addButtonClicked(_ sender: UIButton) {
        if addButton.isSelected {
            addButton.isSelected = false
        } else {
            addButton.isSelected = true
        }

    }
}

extension PlantViewController {
    func postData(_ plantNo: String) {
        // To Server
        SearchDataManager().detailDataManager(plantNo, self)
    }
    
    func successAPI(_ result: DetailDataModel?) {
        if let resultData : SearchPlantModel = result?.result {
            print(resultData)
            searchPlant = resultData
            setupData(plant: searchPlant)
        }
    }
}
