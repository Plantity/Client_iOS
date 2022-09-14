//
//  ResultTableViewCell.swift
//  Plantity
//
//  Created by 최은형 on 2022/07/25.
//

import UIKit

class ResultTableViewCell: UITableViewCell {
    @IBOutlet weak var resultImageView: UIImageView!
    
    @IBOutlet weak var resultNameLabel: UILabel!
    
    @IBOutlet weak var resultLvLabel: UILabel!
    
    @IBOutlet weak var resultIntroLabel: UILabel!
    
    @IBOutlet weak var resultTagLabel: UILabel!
    
    @IBOutlet weak var resultLikeButton: UIButton!
    
    var reusltPlant: SearchPlantModel = SearchPlantModel(plantIdx: 0, cntntsNo: "", cntntsSj: "", plntbneNm: "", plntzrNm: "", adviseInfo: "", orgplceInfo: "", lighttdemanddoCodeNm: "", ignSeasonCodeNm: "", flclrCodeNm: "", watercycleSprngCodeNm: "", managelevelCode: "")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupData(plant: SearchPlantModel?) {
        // setImage
        // guard let imageURLString = imageURLStr else { return }
        // if let url = URL(string: imageURLString) {
            //resultImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "photo")) }
        
        if let plantData : SearchPlantModel = plant {
            resultNameLabel.text = plantData.cntntsSj
            
            switch plantData.managelevelCode {
            case "089001":
                resultLvLabel.text = "난이도 : ⭐️"
            case "089002":
                resultLvLabel.text = "난이도 : ⭐️⭐️"
            case "089003":
                resultLvLabel.text = "난이도 : ⭐️⭐️⭐️"
            default:
                resultLvLabel.text = ""
            }
            
            resultIntroLabel.text = plantData.adviseInfo
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func actionIsResultLike(_ sender: UIButton) {
        if resultLikeButton.isSelected {
            resultLikeButton.isSelected = false
        } else {
            resultLikeButton.isSelected = true
        }
    }
}
