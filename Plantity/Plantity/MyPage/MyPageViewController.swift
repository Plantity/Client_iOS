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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Delegates
        myTableView.delegate = self
        myTableView.dataSource = self
        
        // Registers
        let myTableNib = UINib(nibName: "MyTableViewCell", bundle: nil)
        myTableView.register(myTableNib, forCellReuseIdentifier: "MyTableViewCell")

        setupAttribute()
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
    
    
}

extension MyPageViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = myTableView.dequeueReusableCell(
            withIdentifier: "MyTableViewCell",
            for: indexPath) as? MyTableViewCell
        else { return UITableViewCell() }
        
        cell.titleLabel?.text = (indexPath.section == 0 ? "나의 식물" : "찜한 식물")
        
        cell.selectionStyle = .none
        
        cell.clipsToBounds = true
        cell.layer.cornerRadius = 20
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? MyTableViewCell else { return }

        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // 섹션 간 간격
        return " "
    }
}

extension MyPageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as? MyCollectionViewCell else { return UICollectionViewCell() }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105, height: 105
)
    }
}
