//
//  CardTableViewCell.swift
//  Plantity
//
//  Created by 김다연 on 2022/07/25.
//

import UIKit

class CardTableViewCell: UITableViewCell {
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    func setCollectionViewDataSourceDelegate(dataSourceDelegate:UICollectionViewDelegate & UICollectionViewDataSource,forRow row:Int)
    {
        collectionView.delegate=dataSourceDelegate
        collectionView.dataSource=dataSourceDelegate
        collectionView.tag=row
        let cardNib=UINib(nibName: "CardCollectionViewCell", bundle: nil)
        collectionView.register(cardNib, forCellWithReuseIdentifier: "CardCollectionViewCell")
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        //양옆 떨어진 정도
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        flowLayout.minimumLineSpacing = 12
        
        
        //flowLayout 넣어주기
        collectionView.collectionViewLayout = flowLayout
        collectionView.reloadData()
        
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
