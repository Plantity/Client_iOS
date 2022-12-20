//
//  MyPageViewController.swift
//  Plantity
//
//  Created by 최은형 on 2022/07/26.
//

import UIKit

class MyPageViewController: UIViewController {
    
    @IBOutlet weak var myCardView: UIView!
    
    @IBOutlet weak var myProgressView: UIProgressView!
    
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var myNameLabel: UILabel!
    
    @IBOutlet weak var myMedalImageView: UIImageView!
    
    @IBOutlet weak var myLevelLabel: UILabel!
    
    @IBOutlet weak var myTableView: UITableView!
    
    // tmp
    //var plants: [String] = ["몬스테라","몬스테라","몬스테라","몬스테라"]
    
    // initialize
    var userInfo:ResponseDto = ResponseDto(nickName: "", rating: "", score: 0)
    
    var userPlant:[MyPlantResponseDtos]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // To Server
        let input: Int = 1 // 임시 유저아이디
        MyDataManager().myDataManager(input, self)
        
        // Delegates
        myTableView.delegate = self
        myTableView.dataSource = self
        
        // Registers
        let myTableNib = UINib(nibName: "MyTableViewCell", bundle: nil)
        myTableView.register(myTableNib, forCellReuseIdentifier: "MyTableViewCell")

        setupAttribute()
    }
    
    func successAPI(_ result: MyDataModel) {
        if let responseData : MyDataResult = result.result {
            print(responseData)
            userInfo = responseData.responseDto
            userPlant = responseData.myPlantResponseDtos
        }
        myTableView.reloadData()
        setupData()
    }
    
    private func setupData() {
        myProgressView.setProgress(Float(userInfo.score) / 100, animated: false)
        
        myNameLabel.text = userInfo.nickName
        
        switch userInfo.rating {
        case "비기너":
            myMedalImageView.image = UIImage(named: "image_medal_bronze")
            myLevelLabel.text = "비기너"
        case "가드너":
            myMedalImageView.image = UIImage(named: "image_medal_silver")
            myLevelLabel.text = "가드너"
        case "마스터":
            myMedalImageView.image = UIImage(named: "image_medal_gold")
            myLevelLabel.text = "마스터"
        default:
            myLevelLabel.text = "_"
        }
        
        // 컬렉션 셀 옵저버 -> 식물로그로 이동
        NotificationCenter.default.addObserver(self, selector: #selector(didRecieveLogNotification(_:)), name: Notification.Name("gotoLog"), object: nil)
        // 식물 상세보기로 이동
        NotificationCenter.default.addObserver(self, selector: #selector(didRecieveSearchNotification(_:)), name: Notification.Name("gotoSearch"), object: nil)
    }
    
    @objc func didRecieveLogNotification(_ notification: NSNotification) {
        let gotoPlant: Int = notification.object as! Int
        
        let storyboard=UIStoryboard(name: "LogPage", bundle: nil)
        //식물로그 이동하기
        guard let viewController = storyboard.instantiateViewController(identifier: "LogPageViewController") as? LogPageViewController else { return }
        
        viewController.currentPage = gotoPlant

        self.present(viewController, animated: true, completion: nil)
    }
    
    @objc func didRecieveSearchNotification(_ notification: NSNotification) {
        let _: Int = notification.object as! Int
        
        let storyboard=UIStoryboard(name: "SearchPage", bundle: nil)
        //식물로그 이동하기
        guard let viewController = storyboard.instantiateViewController(identifier: "PlantViewController") as? PlantViewController else { return }
        
        // 상세보기 API 조회
        // viewController.postData(myData.myLikes?[plantIdx].plantNo ?? "")
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func setupAttribute() {
        // Corner Radius
        myCardView.clipsToBounds = true
        myCardView.layer.cornerRadius = 20
        
        myProgressView.clipsToBounds = true
        myProgressView.layer.cornerRadius = 8
        myProgressView.clipsToBounds = true
        myProgressView.layer.sublayers![1].cornerRadius = 8// 뒤에 있는 회색 track
        myProgressView.subviews[1].clipsToBounds = true
        
        myImageView.clipsToBounds = true
        myImageView.layer.cornerRadius = 82 / 2
    }
    
    @IBAction func setButtonClicked(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "MyPage", bundle: nil)
        
        let setVC = storyboard.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController

        
        //self.navigationController?.pushViewController(setVC, animated: true)
        self.present(setVC, animated: true)
    }
}

extension MyPageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = myTableView.dequeueReusableCell(
            withIdentifier: "MyTableViewCell",
            for: indexPath) as? MyTableViewCell
        else { return UITableViewCell() }
        
        cell.titleLabel?.text = (indexPath.row == 0 ? "나의 식물" : "찜한 식물")
        
        cell.selectionStyle = .none
        
        cell.clipsToBounds = true
        cell.layer.cornerRadius = 20
        
        if indexPath.row == 0 {
            // 첫번째 셀: 나의 식물
            cell.configure(with: userPlant)
            cell.isMyPlant = true
        } else {
            // 두번째 셀: 내가 찜한 식물
            // cell.configure(with: myData.myLikes)
            cell.isMyPlant = false
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return myTableView.frame.height / 2 - 20
    }
}
