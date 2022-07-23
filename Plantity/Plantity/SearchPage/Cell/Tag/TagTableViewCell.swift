//
//  TagTableViewCell.swift
//  Plantity
//
//  Created by 최은형 on 2022/07/23.
//

import UIKit

class TagTableViewCell: UITableViewCell {
    @IBOutlet weak var tagCollectionView: UICollectionView!
    
    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDelegate & UICollectionViewDataSource, forRow row: Int) {
        tagCollectionView.delegate = dataSourceDelegate
        tagCollectionView.dataSource = dataSourceDelegate
        tagCollectionView.tag = row
        
        // Register Nib
        let tagNib = UINib(nibName: "TagCollectionViewCell", bundle: nil)
        tagCollectionView.register(tagNib, forCellWithReuseIdentifier: "TagCollectionViewCell")
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        // 여백 구현
        flowLayout.sectionInset = UIEdgeInsets(top: 15, left: 19, bottom: 0, right: 19)

        tagCollectionView.collectionViewLayout = flowLayout

        // collectionView 등록되면 재부팅
        tagCollectionView.reloadData()
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
