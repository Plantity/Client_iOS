//
//  MyTableViewCell.swift
//  Plantity
//
//  Created by 최은형 on 2022/07/26.
//
import UIKit

class MyTableViewCell: UITableViewCell {
    static let identifier = "MyTableViewCell"
    
    // 나의 식물인지 내가 찜한 식물인지
    var isMyPlant: Bool = true
    
    // 임시 Data
    var data: [MyPlantModel] = []
    // subviews 한번만 호출하기 위한 변수
    var didLayoutSubviews: Bool = false
    
    public func configure(with plants: [MyPlantModel]?)
    {
        if let plantData: [MyPlantModel] = plants {
            self.data = plantData
            myCollectionView.reloadData()
        }
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
        if !didLayoutSubviews{
            contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0))
            contentView.backgroundColor = .white
            contentView.layer.cornerRadius = 20
            contentView.clipsToBounds = true
            
            didLayoutSubviews = true
        }
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
        flowLayout.minimumLineSpacing = 12

        myCollectionView.collectionViewLayout = flowLayout
        
        // collectionView 등록되면 재부팅
        myCollectionView.reloadData()
    }
}

extension MyTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as? MyCollectionViewCell else { return UICollectionViewCell() }
        
        cell.configure(with: data[indexPath.row].imageUrl)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105, height: 105)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if isMyPlant == true {
            // 나의 식물 컬렉션이면 로그로 이동
            // MyPage VC 옵저버에 전달
            NotificationCenter.default.post(name: NSNotification.Name("gotoLog"), object: indexPath.row)
            
        } else {
            // 내가 찜한 식물 컬렉션이면 검색 -> 식물 상세보기로 이동
            NotificationCenter.default.post(name: NSNotification.Name("gotoSearch"), object: indexPath.row)
        }
    }
}
