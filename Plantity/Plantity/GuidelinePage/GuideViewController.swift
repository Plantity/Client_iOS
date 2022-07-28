//
//  GuideViewController.swift
//  Plantity
//
//  Created by 최은형 on 2022/07/28.
//

import UIKit

class GuideViewController: UIViewController {
    @IBOutlet weak var newsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNews()
    }
    
    func setupNews() {
        newsCollectionView.dataSource = self
        newsCollectionView.delegate = self
        
        let newsNib = UINib(nibName: "NewsCollectionViewCell", bundle: nil)
        newsCollectionView.register(newsNib, forCellWithReuseIdentifier: "NewsCollectionViewCell")
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)


        newsCollectionView.collectionViewLayout = flowLayout
        
    }
}

extension GuideViewController: UICollectionViewDelegate, UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3 + 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCollectionViewCell", for: indexPath) as? NewsCollectionViewCell else { return UICollectionViewCell() }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 326, height: 157)
    }
}
