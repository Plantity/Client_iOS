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
    
    var searchPlant: SearchPlantModel = SearchPlantModel(plantIdx: 0, cntntsNo: "", cntntsSj: "", plntbneNm: "", plntzrNm: "", adviseInfo: "", orgplceInfo: "", lighttdemanddoCodeNm: "", ignSeasonCodeNm: "", flclrCodeNm: "", watercycleSprngCodeNm: "", managelevelCode: "", plantFollowings: [])
    
    
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
            
            // set Water
            plantWater.text =  plantData.watercycleSprngCodeNm
            
            // set Sun
            plantSun.text =  plantData.lighttdemanddoCodeNm
            
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
