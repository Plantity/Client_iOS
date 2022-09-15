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
        UserInfo(username: "김다연", level: 2, progress: 75)
    ]
    
    var userPlant:[UserPlant]=[
        UserPlant(imageUrl: "https://www.100ssd.co.kr/news/photo/202009/71614_51734_4048.jpg", type: "a", nickname: "찌니꾸", adoptDate:"함께한지 14일 째"),
        UserPlant(imageUrl: "https://static.coupangcdn.com/image/vendor_inventory/a6e2/74c35fa637388b7fdf3ce4a696160fa055ce3748aecc7262259a9f8bbd04.jpg", type: "b", nickname: "땅후니", adoptDate: "함께한지 5일 째"),
        UserPlant(imageUrl: "https://mule4.dingul.io/api/r?l=aHR0cHM6Ly90aHVtYm5haWw5LmNvdXBhbmdjZG4uY29tL3RodW1ibmFpbHMvcmVtb3RlLzQ5Mng0OTJleC9pbWFnZS92ZW5kb3JfaW52ZW50b3J5L2U1ZWMvNGI5YzQxODdjMjYyZGZiOGY2NzIyMmQzZDIzNWVhODU2YjA1NTViYWI2N2IwMTE4MDk5ZDlmMjI5OGFjLmpwZw", type: "c", nickname: "쁘뀨보이", adoptDate: "함께한지 10일 째"),
        UserPlant(imageUrl: "https://mule4.dingul.io/api/r?l=aHR0cHM6Ly90aHVtYm5haWwxMC5jb3VwYW5nY2RuLmNvbS90aHVtYm5haWxzL3JlbW90ZS80OTJ4NDkyZXgvaW1hZ2UvdmVuZG9yX2ludmVudG9yeS9pbWFnZXMvMjAxOC8wOS8xNS8xMy84LzdhMmZiOTczLWJjOTMtNDE0OS1hYzZhLTZhNjEyZjljNjIzZS5qcGc", type: "d", nickname: "유석종", adoptDate: "함께한지 16일 째"),
        UserPlant(imageUrl: "", type: "plus", nickname: "plus", adoptDate: "134")
    ]


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //연동
//        let userinput=UserInfoInput()
//        MainDataManager().maininfoDataManager(userinput)
        
//        let plantinput=UserPlantInput()
//        MainDataManager().plantDataManager(plantinput)
        
        //연동 예시
        MainDataManager().getplantcardTest()
        MainDataManager().postsunTest()
        

        setupCard()
        let userdata=userInfo[0]
        setupUserData(name:userdata.username, level: userdata.level, progress: userdata.progress)
        

        
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
            plantcell.setupCardData(imageUrl:data.imageUrl, type: data.type, nickname: data.nickname, adoptDate: data.adoptDate)
            
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
