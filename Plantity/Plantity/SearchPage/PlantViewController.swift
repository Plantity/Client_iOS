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
    
    @IBOutlet weak var plantDetail: UIStackView!
    
    var searchPlant: SearchPlantModel = SearchPlantModel(name: "", level: 0, intro: "", water: "", sun: "", isUserLiked: false, tag: "")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupAttribute()
        setupData(
            isUserLike: searchPlant.isUserLiked,
            name: searchPlant.name,
            level: searchPlant.level,
            intro: searchPlant.intro,
            water: searchPlant.water,
            sun: searchPlant.sun
        )
    }
    
    func setupAttribute() {
        wsBackground.clipsToBounds = true
        wsBackground.layer.cornerRadius = 20
        
        addButton.clipsToBounds = true
        addButton.layer.cornerRadius = 10
    }
    
    func setupData(isUserLike: Bool?, name: String?, level: Int?, intro: String?, water: String?, sun: String?) {
        
        
        if let isLike:Bool = isUserLike {
            likeButton.isSelected = isLike
        } else {return}
        
        // set image
        
        if let nameStr:String = name {
            plantName.text =  nameStr
        } else {return}
        
        if let levelInt:Int = level {
            switch levelInt {
            case 1:
                plantLevel.text = "⭐️"
            case 2:
                plantLevel.text = "⭐️⭐️"
            case 3:
                plantLevel.text = "⭐️⭐️⭐️"
            default:
                plantLevel.text = ""
            }
        } else {return}
        
        if let introStr: String = intro {
            plantIntro.text =  introStr
        } else {return}
        
        if let waterStr:String = water {
            plantWater.text =  waterStr
        } else {return}
        
        if let sunStr:String = sun {
            plantSun.text =  sunStr
        } else {return}
        
        // set details
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
        searchPlant.isUserLiked = likeButton.isSelected
    }
    
    @IBAction func addButtonClicked(_ sender: UIButton) {
        if addButton.isSelected {
            addButton.isSelected = false
        } else {
            addButton.isSelected = true
        }

    }
}
