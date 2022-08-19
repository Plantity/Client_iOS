//
//  LogPageViewController.swift
//  Plantity
//
//  Created by 김다연 on 2022/07/25.
//

import UIKit
import UPCarouselFlowLayout

class MainPageViewController: UIViewController {
    
    //사용자항목들
    
    
    //카드뷰
    @IBOutlet weak var cardCollectionView: UICollectionView!
    
    //dummies
    var userInfo:[UserInfo]=[
        UserInfo(username: "hailey", level: 2, progress: 49)
    ]
    
    var userPlant:[UserPlant]=[
        UserPlant(imageUrl: "", type: "a", nickname: "a", adoptDate: Date()),
        UserPlant(imageUrl: "", type: "b", nickname: "b", adoptDate: Date()),
        UserPlant(imageUrl: "", type: "c", nickname: "c", adoptDate: Date()),
        UserPlant(imageUrl: "", type: "d", nickname: "d", adoptDate: Date())
    ]


    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCard()
        
    }
    
    func setupCard() {
        // Set Collection View
        cardCollectionView.delegate=self
        cardCollectionView.dataSource=self
        
        let cardNib = UINib(nibName: "CardCollectionViewCell", bundle: nil)
        cardCollectionView.register(cardNib, forCellWithReuseIdentifier: "CardCollectionViewCell")
        
        // Set Carousel
        let layout = UPCarouselFlowLayout()
        layout.itemSize = CGSize(width: cardCollectionView.frame.width, height: cardCollectionView.frame.height)
        layout.scrollDirection = .horizontal
        
        layout.sideItemAlpha = 0.3
        
        //layout.spacingMode = UPCarouselFlowLayoutSpacingMode.overlap(visibleOffset: 150)
        
        cardCollectionView.collectionViewLayout = layout
        
        cardCollectionView.backgroundColor = .none
        
        let appendCardNib=UINib(nibName: "AppendCollectionViewCell", bundle: nil)
        cardCollectionView.register(appendCardNib, forCellWithReuseIdentifier: "AppendCollectionViewCell")
        
        //carousel적용하기
        let appendlayout = UPCarouselFlowLayout()
        appendlayout.itemSize = CGSize(width: cardCollectionView.frame.width, height: 500)
        appendlayout.scrollDirection = .horizontal
        appendlayout.sideItemAlpha = 0.3
        cardCollectionView.collectionViewLayout = layout
        
        
    }

}


extension MainPageViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    //카드갯수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        if userPlant.count != 0{
            //식물이 하나라도 있으면 -> 식물개수만큼
            return userPlant.count
        }else{
            //식물이 하나도 없으면 1개
            return 1
        }

        
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
    
        if userPlant.count != 0{
            
            //if 식물이 하나라도 있으면
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCollectionViewCell", for: indexPath) as? CardCollectionViewCell else{
                return UICollectionViewCell()
            }
            cell.layer.cornerRadius = 12
            
            let data=userPlant[indexPath.row]
            cell.setupCardData(imageUrl:data.imageUrl, type: data.type, nickname: data.nickname, adoptDate: data.adoptDate)
            
            return cell

        }else{
            
            //else 식물이 하나도 없으면 -> 만들어놓은 식물추가 nib을 사용하고 추가페이지로 연결
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AppendCollectionViewCell", for: indexPath) as? AppendCollectionViewCell else{
                return UICollectionViewCell()
            }
            cell.layer.cornerRadius = 12
            
            
            
            return cell

        }

        
 

    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 450)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if userPlant.count != 0{
            let storyboard=UIStoryboard(name: "LogPage", bundle: nil)
            
            guard let viewController = storyboard.instantiateViewController(identifier: "LogPageViewController") as? LogPageViewController else { return }

            self.modalPresentationStyle = UIModalPresentationStyle.fullScreen

            self.present(viewController, animated: true, completion: nil)
    //        self.navigationController?.pushViewController(viewController, animated: true)

        }else{
            let storyboard=UIStoryboard(name: "MainPage", bundle: nil)
            
            guard let viewController = storyboard.instantiateViewController(identifier: "AddPlantViewController") as? AddPlantViewController else { return }

            self.modalPresentationStyle = UIModalPresentationStyle.fullScreen

            
            self.present(viewController, animated: true, completion: nil)
    //        self.navigationController?.pushViewController(viewController, animated: true)

        }
    
        
        

        
    }
}
