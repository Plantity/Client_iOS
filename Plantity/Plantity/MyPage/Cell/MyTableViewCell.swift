//
//  MyTableViewCell.swift
//  Plantity
//
//  Created by 최은형 on 2022/07/26.
//
import UIKit

class MyTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDelegate & UICollectionViewDataSource, forRow row: Int) {
        myCollectionView.delegate = dataSourceDelegate
        myCollectionView.dataSource = dataSourceDelegate
        myCollectionView.tag = row
        
        // Register
        let myCollectionNib = UINib(nibName: "MyCollectionViewCell", bundle: nil)
        myCollectionView.register(myCollectionNib, forCellWithReuseIdentifier: "MyCollectionViewCell")
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        // 여백 구현
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        flowLayout.minimumLineSpacing = 12

        myCollectionView.collectionViewLayout = flowLayout

        // collectionView 등록되면 재부팅
        myCollectionView.reloadData()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
