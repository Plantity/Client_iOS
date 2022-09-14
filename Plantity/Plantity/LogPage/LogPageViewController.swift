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
    
    // 페이지 컨트롤
    @IBOutlet weak var pageControl: UIPageControl!
    // 처음에 보여줄 식물로그
    var currentPage: Int = 0
    
    //하단로그collectionView
    @IBOutlet weak var logCollectionView: UICollectionView!
    
    //dummies
    var logUserPlant:[LogUserPlant]=[
        LogUserPlant(imageUrl: "", nickname: "찌니꾸", type: "몬스테라", plantlevel: 3, plantMemo: "🌳물은 일주일에 한번 주기"),
        LogUserPlant(imageUrl: "", nickname: "땅후니", type: "대봉룡", plantlevel: 3, plantMemo: "🌳매일매일 물주기"),
        LogUserPlant(imageUrl: "", nickname: "쁘뀨보이", type: "양팔선인장", plantlevel: 3, plantMemo: "🌳물은 한달에 한번만!"),
        LogUserPlant(imageUrl: "", nickname: "유석종", type: "다육선인장", plantlevel: 3, plantMemo: "🌳3일에 한번씩 물 주기")
    ]
    
    var calendars: [LogCalendar] = [
        LogCalendar(date: ["2022-08-26"], todos: [TodoLog(didwater: false, didsun: false, didlook: false, didsplit: false)]),
        LogCalendar(date: ["2022-08-26"], todos: [TodoLog(didwater: true, didsun: true, didlook: true, didsplit: true)]),
        LogCalendar(date: ["2022-08-26"], todos: [TodoLog(didwater: true, didsun: true, didlook: false, didsplit: false)])
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCard()
        setupPageControl()
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

    func setupPageControl() {
        //페이지 컨트롤의 전체 페이지를 images 배열의 전체 개수 값으로 설정
        pageControl.numberOfPages = logUserPlant.count
        // 페이지 컨트롤의 현재 페이지를 0으로 설정
        pageControl.currentPage = self.currentPage
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
        
        //자동스크롤
//        cardcollectionView.indexPath(for: <#T##UICollectionViewCell#>)
//        logCollectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .left, animated: true)
        
        
    }
    

    

}



//카드
extension LogPageViewController : UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{

    //cell갯수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return logUserPlant.count
    }

    //customCell생성
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
//        let cardcurrentIndex=indexPath.row
//        print("위",cardcurrentIndex)
        
        if collectionView == cardcollectionView {
            guard let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }

            customCell.layer.cornerRadius=10
            
            let data = logUserPlant[indexPath.row]
            customCell.setupCardData(image: data.imageUrl, nickname: data.nickname, type: data.type, level: data.plantlevel, memo: data.plantMemo)
            
            //자동스크롤
//            let cardcurrentIndex=indexPath.row
//            print("위",cardcurrentIndex)

//            logCollectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .left, animated: true)
            
            return customCell

        }else{
            // 캘린더 셀
            guard let calendarCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCollectionViewCell", for: indexPath) as? CalendarCollectionViewCell else { return UICollectionViewCell() }
            calendarCell.layer.cornerRadius=10
            //자동스크롤
//            let logcurrentIndex=indexPath.row
//            print("아래",logcurrentIndex)
            
            // 캘린더에 데이터 넘기기
            let data = calendars[currentPage]
            calendarCell.setUpEvents(data: data)
//            logCollectionView.scrollToItem(at: IndexPath(item: logcurrentIndex, section: 0), at: .left, animated: true)
            
            return calendarCell
        }
        
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let nextPage = Int(targetContentOffset.pointee.x / cardcollectionView.frame.width) + 1
        if currentPage == nextPage {
            // 맨처음 페이지일 경우
            currentPage = 0
        } else {
            currentPage = nextPage
        }
        
        // 페이징 버튼 변경
        self.pageControl.currentPage = self.currentPage
        
        // 달력 변경
        logCollectionView.reloadData()
    }
}


