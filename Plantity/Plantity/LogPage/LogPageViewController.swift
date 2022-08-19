//
//  LogPageViewController.swift
//  Plantity
//
//  Created by 김다연 on 2022/07/26.
//

import UIKit
import FSCalendar
import UPCarouselFlowLayout

//데이트포멧터 선언




class LogPageViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource,FSCalendarDelegateAppearance {
    
    
    //상단카드collectionView
    @IBOutlet weak var cardcollectionView: UICollectionView!
    
    //하단로그collectionView
    @IBOutlet weak var logCollectionView: UICollectionView!
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCard()
        setUplogCV()
        
    }
    
    func setupCard() {
        cardcollectionView.dataSource=self
        cardcollectionView.delegate=self
        
        let cardNib=UINib(nibName: "CollectionViewCell", bundle: nil)
        cardcollectionView.register(cardNib, forCellWithReuseIdentifier: "CollectionViewCell")
        
        // Carousel 적용
        let layout = UPCarouselFlowLayout()
        layout.itemSize = CGSize(width: cardcollectionView.frame.width-50*2, height: 170)
        layout.scrollDirection = .horizontal
        layout.sideItemAlpha = 0.3
        layout.spacingMode = UPCarouselFlowLayoutSpacingMode.fixed(spacing: 10)
        
        cardcollectionView.collectionViewLayout = layout
    }


    
    func setUplogCV(){
        logCollectionView.dataSource=self
        logCollectionView.delegate=self
        
        let logNib=UINib(nibName: "CalendarCollectionViewCell", bundle: nil)
        logCollectionView.register(logNib, forCellWithReuseIdentifier: "CalendarCollectionViewCell")
        
        // Carousel 적용-> 형식 변경하기
        let layout = UPCarouselFlowLayout()
        layout.itemSize = CGSize(width: logCollectionView.frame.width, height: 500)
        layout.scrollDirection = .horizontal
        layout.sideItemAlpha = 0.3
        logCollectionView.collectionViewLayout = layout
        
        
        
    }
    

    

}



//카드
extension LogPageViewController : UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{

    //collection view의 cell 을 10개 생성
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    //customCell생성
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == cardcollectionView {
            guard let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }

            customCell.layer.cornerRadius=10
            return customCell

        }else{
            guard let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCollectionViewCell", for: indexPath) as? CalendarCollectionViewCell else { return UICollectionViewCell() }

            customCell.layer.cornerRadius=10
            return customCell
        }

    }
}


