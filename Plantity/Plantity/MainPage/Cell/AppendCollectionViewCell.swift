//
//  AppendCollectionViewCell.swift
//  Plantity
//
//  Created by 김다연 on 2022/08/19.
//

import UIKit

class AppendCollectionViewCell: UICollectionViewCell {



    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }
    func setupcard() {

    }
    
    @IBAction func cardAppendButton(_ sender: Any) {
        
//        버튼누르면 추가페이지 모달 띄우기
        
        let storyboard=UIStoryboard(name: "MainPageViewController", bundle: nil)
        
        guard let viewController = storyboard.instantiateViewController(identifier: "AddPlantViewController") as? AddPlantViewController else { return }

        viewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen

        
//        self.present(viewController, animated: true, completion: nil)
//        self.navigationController?.pushViewController(viewController, animated: true)
        
        
    }
    
}
