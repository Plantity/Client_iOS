//
//  LogPageViewController.swift
//  Plantity
//
//  Created by 김다연 on 2022/07/26.
//

import UIKit



class LogPageViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let customLayout = CustomFlowLayout()
        collectionView.collectionViewLayout = customLayout
        collectionView.dataSource = self
//        collectionView.layer.cornerRadius=10


        // Do any additional setup after loading the view.
    }
    

}

class CustomFlowLayout:UICollectionViewFlowLayout{
    private var isInit: Bool = false
    
    //prepare에서 collectionviewLayout의 초기세팅을 진행한다
    override func prepare() {
        super.prepare()
        //collectionview의 bounds가 변화할때마다 메소드 호출
        guard !isInit else{return}
        
        guard let collectionView = self.collectionView else{return}
        
        let collectionViewSize = collectionView.bounds
        itemSize = CGSize(width: collectionViewSize.width-50*2, height: 150)
        
        let xInset = (collectionViewSize.width-itemSize.width) / 2
        self.sectionInset = UIEdgeInsets(top: 0, left: xInset, bottom: 0, right: xInset)
        
        scrollDirection = .horizontal
        
        
        
        minimumLineSpacing = 10 - (itemSize.width - itemSize.width*0.7)/2
        
        
        
        
        isInit = true
            }
            
            override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
                return true
            
    }
    
    
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
            let superAttributes = super.layoutAttributesForElements(in: rect)
            
            superAttributes?.forEach { attributes in
                guard let collectionView = self.collectionView else { return }
                
                let collectionViewCenter = collectionView.frame.size.width / 2
                let offsetX = collectionView.contentOffset.x
                let center = attributes.center.x - offsetX
                
                let maxDis = self.itemSize.width + self.minimumLineSpacing
                let dis = min(abs(collectionViewCenter-center), maxDis)
                
                let ratio = (maxDis - dis)/maxDis
                let scale = ratio * (1-0.7) + 0.7
                
//                collectionView.layer.cornerRadius=12
                attributes.transform = CGAffineTransform(scaleX: scale, y: scale)
            }
            
            return superAttributes
       }
        
}



extension LogPageViewController : UICollectionViewDataSource{
    
    //collection view의 cell 을 10개 생성
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    //customCell생성
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
        
        customCell.layer.cornerRadius=10
        
//배경색 변경하는 부분 주석처리
//                let ratio: CGFloat = CGFloat(indexPath.row+1)/CGFloat(10+1)
                
//                customCell.contentView.backgroundColor = UIColor(red: 255*ratio/255,
//                                                                 green: 50/255,
//                                                                 blue: 255*ratio/255,
//                                                                 alpha: 1.0)
                return customCell
    }
}
