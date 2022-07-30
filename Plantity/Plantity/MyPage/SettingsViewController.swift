//
//  SettingsViewController.swift
//  Plantity
//
//  Created by 최은형 on 2022/07/30.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var settingTableView: UITableView!
    
    let settings: [String] = ["개인 정보 수정", "알림", "의견보내기", "버전정보", "신고", "로그아웃", "회원탈퇴"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }

    func setupTableView() {
        settingTableView.dataSource = self
        settingTableView.delegate = self
        
        settingTableView.separatorStyle = .none
    }
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell();

        cell.textLabel?.text = settings[indexPath.row]
        
        return cell;
    }
    
    
}
