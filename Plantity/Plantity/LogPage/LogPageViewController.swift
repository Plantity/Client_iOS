//
//  LogPageViewController.swift
//  Plantity
//
//  Created by 김다연 on 2022/07/26.
//

import UIKit
import FSCalendar

//데이트포멧터 선언
let dateFormatter = DateFormatter()

class LogPageViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource,FSCalendarDelegateAppearance {
    
    @IBOutlet weak var collectionView: UICollectionView!

    @IBOutlet weak var messageView: UIView!
    
    @IBOutlet weak var calendarView: FSCalendar!
    
//    var selectedDate:Date=Date()
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let customLayout = CustomFlowLayout()
        collectionView.collectionViewLayout = customLayout
        collectionView.dataSource = self
        
        
        
        
        //메세지
        messageView.clipsToBounds = true
        messageView.layer.cornerRadius = 30
        messageView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner,.layerMaxXMinYCorner)
        
        
        //달력
        dateFormatter.dateFormat = "yyyy-MM-dd"
        calendarView.delegate = self
        calendarView.dataSource = self
        
        
        //주간달력으로 변경
        calendarView.scope = .week
        //언어변경
        calendarView.locale = Locale(identifier: "en_US")
        //글자색 변경-월.연도 글씨
        calendarView.appearance.headerTitleColor = UIColor.darkGray
        //글자색 변경-월화수목금
        calendarView.appearance.weekdayTextColor = UIColor.darkGray
        //오늘해당하는 동그라미
        calendarView.appearance.todayColor=UIColor.systemGreen
        //날자 클릭시 동그라미
        calendarView.appearance.selectionColor=UIColor.lightGray


        // Do any additional setup after loading the view.

        
    }
    


}


extension ViewController:FSCalendarDelegate,FSCalendarDataSource,FSCalendarDelegateAppearance{
    
    // 날짜 선택 시 할일을 지정
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print(dateFormatter.string(from: date) + " 선택됨")

        
    }
    // 날짜 선택 해제 시 콜백 메소드
    public func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print(dateFormatter.string(from: date) + " 해제됨")
    }
}



class CustomFlowLayout:UICollectionViewFlowLayout{
    private var isInit: Bool = false
    
    //prepare에서 collectionviewLayout의 초기세팅을 진행한다
    override func prepare() {
        super.prepare()
        //collectionview의 bounds가 변화할때마다 메소드 호출
        guard !isInit else{return}
        
        guard let collectionView = self.collectionView else{return}
        
        let collectionViewSize = collectionView.bounds
        itemSize = CGSize(width: collectionViewSize.width-50*2, height: 170)
        
        let xInset = (collectionViewSize.width-itemSize.width) / 2
        self.sectionInset = UIEdgeInsets(top: 0, left: xInset, bottom: 0, right: xInset)
        
        scrollDirection = .horizontal
        
        
        //카드 떨어져 있는 정도 ->40
        minimumLineSpacing = 40 - (itemSize.width - itemSize.width*0.7)/2
        
        
        
        
        isInit = true
            }
            
            override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
                return true
            
    }
    
    
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
            let superAttributes = super.layoutAttributesForElements(in: rect)
            
            superAttributes?.forEach { attributes in
                guard let collectionView = self.collectionView else { return }
                
                let collectionViewCenter = collectionView.frame.size.width / 2
                let offsetX = collectionView.contentOffset.x
                let center = attributes.center.x - offsetX
                
                let maxDis = self.itemSize.width + self.minimumLineSpacing
                let dis = min(abs(collectionViewCenter-center), maxDis)
                
                let ratio = (maxDis - dis)/maxDis
                //크기변경 + 0.1
                let scale = ratio * (1-0.7) + 0.7+0.1
                
//                collectionView.layer.cornerRadius=12
                attributes.transform = CGAffineTransform(scaleX: scale, y: scale)
            }
            
            return superAttributes
       }
        
}



extension LogPageViewController : UICollectionViewDataSource{
    
    //collection view의 cell 을 10개 생성
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    //customCell생성
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
        
        customCell.layer.cornerRadius=10
        
//배경색 변경하는 부분 주석처리
//                let ratio: CGFloat = CGFloat(indexPath.row+1)/CGFloat(10+1)
                
//                customCell.contentView.backgroundColor = UIColor(red: 255*ratio/255,
//                                                                 green: 50/255,
//                                                                 blue: 255*ratio/255,
//                                                                 alpha: 1.0)
                return customCell
    }
}
