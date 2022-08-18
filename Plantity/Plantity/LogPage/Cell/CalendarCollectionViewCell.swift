//
//  CalendarCollectionViewCell.swift
//  Plantity
//
//  Created by 김다연 on 2022/08/18.
//

import UIKit
import FSCalendar
import UPCarouselFlowLayout

////데이트포멧터 선언
//let formatter = DateFormatter()

class CalendarCollectionViewCell: UICollectionViewCell,FSCalendarDelegate, FSCalendarDataSource,FSCalendarDelegateAppearance {
    
    //전체뷰
    @IBOutlet weak var logView: UIView!
    
    //3등분
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var calendarView: FSCalendar!
    @IBOutlet weak var todoView: UIView!
    
    //요소
    @IBOutlet weak var didWaterLabel: UILabel!
    @IBOutlet weak var didLookLabel: UILabel!
    @IBOutlet weak var didSunLabel: UILabel!
    @IBOutlet weak var didSplitLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpLog()
//        setUpEvents()
    }
    
    func setUpLog() {
        logView.layer.cornerRadius = 10
        logView.clipsToBounds = true
        
        //메세지(알림)
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
            didWaterLabel.text="물 주기 완료!"
        }else{
            didWaterLabel.text="물을 주지 않았어요"
        }
        //살펴보기
        if(self.events.contains(date)){
            didLookLabel.text="살펴보기 완료!"
        }else{
            didLookLabel.text="살펴보지 않았어요"
        }
        //씻겨주기
        if(self.events.contains(date)){
            didSunLabel.text="햇살주기 완료!"
        }else{
            didSunLabel.text="햇살을 보지 않았어요"
        }
        //분갈이
        if(self.events.contains(date)){
            didSplitLabel.text="분갈이 완료!"
        }else{
            didSplitLabel.text="분갈이하지 않았어요"
        }
        
    }
    
    // 날짜 선택 해제 시 콜백 메소드
    public func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        formatter.dateFormat="yyyy-MM-dd"
        print(formatter.string(from: date) + " 해제됨")
    }
}

//달력
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
