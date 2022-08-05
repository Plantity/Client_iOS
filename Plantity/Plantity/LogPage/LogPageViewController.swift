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
let formatter = DateFormatter()



class LogPageViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource,FSCalendarDelegateAppearance {
    
    @IBOutlet weak var collectionView: UICollectionView!

    @IBOutlet weak var messageView: UIView!
    
    @IBOutlet weak var calendarView: FSCalendar!
    
    @IBOutlet weak var dateMessageView: UIView!
    
    @IBOutlet weak var wateringyesLabel: UILabel!
    
    @IBOutlet weak var lookingyesLabel: UILabel!
    
    @IBOutlet weak var showeringyesLabel: UILabel!
    
    @IBOutlet weak var soilingyesLabel: UILabel!
    //    var selectedDate:Date=Date()
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // let customLayout = CustomFlowLayout()
        // collectionView.collectionViewLayout = customLayout
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
        
        //메세지
        messageView.clipsToBounds = true
        messageView.layer.cornerRadius = 30
        messageView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner,.layerMaxXMinYCorner)
        
        
        //달력
       
        
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

        // Carousel 적용
        setupCard()
        setUpEvents()
        
    }
    
    func setupCard() {
        let layout = UPCarouselFlowLayout()
        layout.itemSize = CGSize(width: collectionView.frame.width-50*2, height: 170)
        layout.scrollDirection = .horizontal
        
        layout.sideItemAlpha = 0.3
        
        layout.spacingMode = UPCarouselFlowLayoutSpacingMode.fixed(spacing: 10)
        
        collectionView.collectionViewLayout = layout
    }
    
    //이벤트 배열 선언-예시
    var events=[Date]()
    //실제
    var wateringdays=[Date]()
    var lookingdays=[Date]()
    var showeringdays=[Date]()
    var soilingdays=[Date]()

    
    func setUpEvents() {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy-MM-dd"
        let xmas = formatter.date(from: "2022-08-02")
        let sampledate = formatter.date(from: "2022-08-01")
        
        events = [xmas!, sampledate!]
        wateringdays = [xmas!, sampledate!]
        lookingdays = [xmas!, sampledate!]
        showeringdays = [xmas!, sampledate!]
        soilingdays = [xmas!, sampledate!]
    }
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        if self.wateringdays.contains(date){
            return 1
        }else{
            return 0
        }
    }
    
    // 날짜 선택 시 할일을 지정
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        formatter.dateFormat="yyyy-MM-dd"
        print(formatter.string(from: date) + " 선택됨")
        //물주기
        if(self.events.contains(date)){
            wateringyesLabel.text="물 주기 완료!"
        }else{
            wateringyesLabel.text="물을 주지 않았어요"
        }
        //살펴보기
        if(self.events.contains(date)){
            lookingyesLabel.text="살펴보기 완료!"
        }else{
            lookingyesLabel.text="살펴보지 않았어요"
        }
        //씻겨주기
        if(self.events.contains(date)){
            showeringyesLabel.text="씻겨주기 완료!"
        }else{
            showeringyesLabel.text="씻겨 주지 않았어요"
        }
        //분갈이
        if(self.events.contains(date)){
            soilingyesLabel.text="분갈이 완료!"
        }else{
            soilingyesLabel.text="분갈이하지 않았어요"
        }
        
        

        

        
    }
    // 날짜 선택 해제 시 콜백 메소드
    public func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        formatter.dateFormat="yyyy-MM-dd"
        print(formatter.string(from: date) + " 해제됨")
    }


}


extension ViewController:FSCalendarDelegate,FSCalendarDataSource,FSCalendarDelegateAppearance{



    // 날짜 선택 시 할일을 지정
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print(formatter.string(from: date) + " 선택됨")


    }
    // 날짜 선택 해제 시 콜백 메소드
    public func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print(formatter.string(from: date) + " 해제됨")
    }
}


/*
class CustomFlowLayout:UICollectionViewFlowLayout{
    private var isInit: Bool = false

    prepare에서 collectionviewLayout의 초기세팅을 진행한다
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

 */

extension LogPageViewController : UICollectionViewDataSource, UICollectionViewDelegate{

    //collection view의 cell 을 10개 생성
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }

    //customCell생성
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }

        customCell.layer.cornerRadius=10


                return customCell
    }
}
