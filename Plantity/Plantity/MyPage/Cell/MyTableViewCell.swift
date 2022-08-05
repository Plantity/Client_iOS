//
//  MyTableViewCell.swift
//  Plantity
//
//  Created by 최은형 on 2022/07/26.
//
import UIKit

class MyTableViewCell: UITableViewCell {
    static let identifier = "MyTableViewCell"
    
    // 임시 Data
    var data: [String] = []
    
    public func configure(with plants: [String]) {
        self.data = plants
        myCollectionView.reloadData()
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var myCollectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupCollectionView()
    }
    
    override func layoutSubviews() {
        // 셀 간 간격
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0))
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 20
        contentView.clipsToBounds = true
    }
    
    public func setupCollectionView() {
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        // myCollectionView.tag = row
        
        // Register
        let myCollectionNib = UINib(nibName: "MyCollectionViewCell", bundle: nil)
        myCollectionView.register(myCollectionNib, forCellWithReuseIdentifier: "MyCollectionViewCell")
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        // 여백 구현
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        flowLayout.minimumLineSpacing = 12

        myCollectionView.collectionViewLayout = flowLayout
        
        // collectionView 등록되면 재부팅
        myCollectionView.reloadData()
    }
}

extension MyTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as? MyCollectionViewCell else { return UICollectionViewCell() }
        
        cell.configure(with: data)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: myCollectionView.frame.height - 10, height: myCollectionView.frame.height - 10)
    }
}
