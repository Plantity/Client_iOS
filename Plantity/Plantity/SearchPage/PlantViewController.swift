//
//  ResultViewController.swift
//  Plantity
//
//  Created by 최은형 on 2022/08/07.
//

import UIKit

class PlantViewController: UIViewController {
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var plantImageView: UIImageView!
    @IBOutlet weak var plantName: UILabel!
    @IBOutlet weak var plantLevel: UILabel!
    @IBOutlet weak var plantIntro: UILabel!
    
    @IBOutlet weak var plantWater: UILabel!
    @IBOutlet weak var plantSun: UILabel!
    
    @IBOutlet weak var plantDetail: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func LikeButtonClicked(_ sender: UIButton) {
        if likeButton.isSelected {
            likeButton.isSelected = false
        } else {
            likeButton.isSelected = true
        }
    }
    
    @IBAction func addButtonClicked(_ sender: UIButton) {
        if addButton.isSelected {
            addButton.isSelected = false
        } else {
            addButton.isSelected = true
        }

    }
}
