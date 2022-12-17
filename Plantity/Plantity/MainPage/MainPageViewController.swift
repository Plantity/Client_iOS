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
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    //카드뷰
    @IBOutlet weak var cardCollectionView: UICollectionView!
    
    //dummies
    var userInfo:[UserInfo]=[
        UserInfo(username: "고해주", level: 2, progress: 75)
    ]
    
    var userPlant:[UserPlant]=[
        UserPlant(myPlantId: 1,
                  plantName: "필로덴드론",
                  plantNickName: "새삼이",
                  plantAdaptTime: "11.22",
                  filePath: "https://www.100ssd.co.kr/news/photo/202009/71614_51734_4048.jpg"),
        UserPlant(myPlantId: 1,
                  plantName: "필로덴드론",
                  plantNickName: "새삼이",
                  plantAdaptTime: "11.22",
                  filePath: "https://www.100ssd.co.kr/news/photo/202009/71614_51734_4048.jpg"),
        UserPlant(myPlantId: 1,
                  plantName: "plus",
                  plantNickName: "plus",
                  plantAdaptTime: "11.22",
                  filePath: "https://www.100ssd.co.kr/news/photo/202009/71614_51734_4048.jpg")
    ]


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //연동
//        let userinput=UserInfoInput()
//        MainDataManager().maininfoDataManager(userinput)
        
//        let plantinput=UserPlantInput()
//        MainDataManager().plantDataManager(plantinput)
        
        // 내 식물 목록 가져오기 (서버통신)
        MainDataManager().plantCardDataManager(self)
        
     

        setupCard()
        let userdata=userInfo[0]
        setupUserData(name:userdata.username, level: userdata.level, progress: userdata.progress)
        

        NotificationCenter.default.addObserver(self, selector: #selector(didRecieveAssignNotification(_:)), name: Notification.Name("didAssign"), object: nil)
    }
    
    @objc func didRecieveAssignNotification(_ notification: NSNotification) {
        let assignStr: String = notification.object as! String
        
        setupModal(assignStr)
    }
    
    func setupModal(_ assign: String) {
        var assignStr = ""
        switch assign {
        case "water": assignStr = "물주기"
        case "repot": assignStr = "분갈이"
        case "look": assignStr = "살펴보기"
        case "sun": assignStr = "햇빛"
        default: assignStr = ""
        }
        
        let alert = UIAlertController(title: "알림", message: "\(assignStr) 과제를 완료할까요?", preferredStyle: .alert)
        
//        alert.addAction(UIAlertAction(title: "취소", style: .default) { action in
//          //취소처리...
//        })
        alert.addAction(UIAlertAction(title: "확인", style: .default) { action in
          //확인처리...
            //
            // 임시 id
            //
            
            //main으로 바꿈 (편의상)
//            LogDataManager().LogRepotDataManager(assign, 1, 0, self)
            
            
            // assign 에 따라 다른 과제 put 하기
            switch assign {
            case "water": MainDataManager().MainWaterAssignDataManager(assign, 1, 0, self)
            case "repot": MainDataManager().MainRepotAssignDataManager(assign, 1, 0, self)
            case "look": MainDataManager().MainLookAssignDataManager(assign, 1, 0, self)
            case "sun": MainDataManager().MainSunAssignDataManager(assign, 1, 0, self)
            default://default로 일단 repot해놈
                MainDataManager().MainRepotAssignDataManager(assign, 1, 0, self)
            }
//            MainDataManager().MainRepotAssignDataManager(assign, 1, 0, self)
        })
        self.present(alert, animated: true, completion: nil)
    }
    
    func setupUserData(name:String?,level:Int?,progress:Int?){
        
        //이름
        if let nameStr:String=name{
            usernameLabel.text=nameStr
        }
        
        //레벨
        if let levelInt:Int=level{
            if levelInt==1{
                welcomeLabel.text="안녕하세요 레벨 1 오늘도 민첩한 식물인이 되세요!"
            }else if levelInt==2{
                welcomeLabel.text="벌써 레벨2까지 왔습니다! 오늘도 민첩한 식물인이 되세요🌳"
            }else if levelInt==3{
                welcomeLabel.text="안녕하세요 레벨 3 오늘도 민첩한 식물인이 되세요!"
            }else{
                welcomeLabel.text="안녕하세요 레벨 4 오늘도 민첩한 식물인이 되세요!"
            }
            
        }
        
        //게이지
        if let progressInt:Int=progress{
            progressBar.progress=Float(progressInt)/100
            progressLabel.text=String(progressInt)
        }
        
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
    
    func successGETAPI(_ result: UserPlantModel?){
//        if let resultData : UserPlant = result?.result {
//            userPlant += resultData.nickname
//
//        }
        
        self.userPlant = (result?.result)!
        
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
            
            //마지막 추가셀
            if indexPath.row == userPlant.count {
                guard let appendcell = collectionView.dequeueReusableCell(withReuseIdentifier: "AppendCollectionViewCell", for: indexPath) as? AppendCollectionViewCell else{
                    return UICollectionViewCell()
                }
                appendcell.layer.cornerRadius = 12
                
                return appendcell
            }
            
            //plantcell선언
            guard let plantcell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCollectionViewCell", for: indexPath) as? CardCollectionViewCell else{
                return UICollectionViewCell()
            }
            plantcell.layer.cornerRadius = 12
            
            
            let data=userPlant[indexPath.row]
            plantcell.setupCardData(filePath: data.filePath, plantName: data.plantName, plantNickName: data.plantNickName, myPlantId: "")
            
            
            return plantcell

        }
        
        //식물이 아예 없으면 -> pluscell하나만 리턴
        else{
            //pluscell 선언
            guard let pluscell = collectionView.dequeueReusableCell(withReuseIdentifier: "AppendCollectionViewCell", for: indexPath) as? AppendCollectionViewCell else{
                return UICollectionViewCell()
            }
            pluscell.layer.cornerRadius = 12
            
            //else 식물이 하나도 없으면 -> 만들어놓은 식물추가 nib을 사용하고 추가페이지로 연결
            return pluscell

        }

        
 

    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 450)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        
        //카드개수 0개가 아니면
        if userPlant.count != 0{
            //마지막 카드인지 검사 ->  식물추가페이지로 이동
            if indexPath.row == userPlant.count-1 {
                
                let storyboard=UIStoryboard(name: "MainPage", bundle: nil)
                //더하기 버튼 이동하기
                guard let plusviewController = storyboard.instantiateViewController(identifier: "AddPlantViewController") as? AddPlantViewController else { return }

                self.modalPresentationStyle = UIModalPresentationStyle.fullScreen


                self.present(plusviewController, animated: true, completion: nil)
//                self.navigationController?.pushViewController(plusviewController, animated: true)
                
                
            }else{
                let storyboard=UIStoryboard(name: "LogPage", bundle: nil)
                //식물로그 이동하기
                guard let viewController = storyboard.instantiateViewController(identifier: "LogPageViewController") as? LogPageViewController else { return }

//                viewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen

                self.present(viewController, animated: true, completion: nil)
//                 self.navigationController?.pushViewController(viewController, animated: true)
            }

        }
        //카드개수 0개라면
        else{
            let storyboard=UIStoryboard(name: "MainPage", bundle: nil)
            
            guard let plusviewController = storyboard.instantiateViewController(identifier: "AddPlantViewController") as? AddPlantViewController else { return }

            self.modalPresentationStyle = UIModalPresentationStyle.fullScreen

            
            self.present(plusviewController, animated: true, completion: nil)
//            self.navigationController?.pushViewController(plusviewController, animated: true)

        }
    
        
        

        
    }
}


extension MainPageViewController{
    func successuserAPI(_ result: [UserInfo]){
        userInfo=result
        cardCollectionView.reloadData()
    }
    
    func successplantAPI(_ result: [UserPlant]){
        userPlant=result
        cardCollectionView.reloadData()
    }
    
//    func successtodoAPI(){
//        let input= ?
//        MainDataManager().posts(self, input)
//    }
}
