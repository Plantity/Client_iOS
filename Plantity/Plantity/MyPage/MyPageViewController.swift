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
    // response 예시
    var myData : MyModelResult = MyModelResult(myInfo: MyInfo(username: "ㅇㅇㅇ", userId: "1234", level: 1, progress: 30), myPlants: ["몬스테라"], myLikes: ["베고니아"])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // To Server
        // let input = MyDataInput(limit: 10, page: 0)
        // MyDataManager().feedDataManager(input, self)
        
        // Delegates
        myTableView.delegate = self
        myTableView.dataSource = self
        
        // Registers
        let myTableNib = UINib(nibName: "MyTableViewCell", bundle: nil)
        myTableView.register(myTableNib, forCellReuseIdentifier: "MyTableViewCell")

        setupAttribute()
        setupData()
    }
    
    func successAPI(_ result: MyDataModel) {
        // myData = result
        // tableView.reloadData()
    }
    
    private func setupData() {
        if let userInfo : MyInfo = myData.myInfo {
            myProgressView.setProgress(Float(userInfo.progress ?? 0) / 100, animated: false)
            
            myNameLabel.text = userInfo.username
            
            switch userInfo.level {
            case 0:
                myMedalImageView.image = UIImage(named: "image_medal_bronze")
                myLevelLabel.text = "비기너"
            case 1:
                myMedalImageView.image = UIImage(named: "image_medal_silver")
                myLevelLabel.text = "가드너"
            case 2:
                myMedalImageView.image = UIImage(named: "image_medal_gold")
                myLevelLabel.text = "마스터"
            default:
                myLevelLabel.text = "_"
            }
        }
        
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

        
        self.navigationController?.pushViewController(setVC, animated: true)
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
            cell.configure(with: myData.myPlants)
            cell.isMyPlant = true
        } else {
            // 두번째 셀: 내가 찜한 식물
            cell.configure(with: myData.myLikes)
            cell.isMyPlant = false
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return myTableView.frame.height / 2 - 20
    }
}
