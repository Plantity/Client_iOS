//
//  GuideViewController.swift
//  Plantity
//
//  Created by 최은형 on 2022/07/28.
//

import UIKit
import UPCarouselFlowLayout

class GuideViewController: UIViewController {
    @IBOutlet weak var newsCollectionView: UICollectionView!
    
    @IBOutlet weak var guideCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 상단 Carousel
        setupNews()
        // 하단 글 목록
        setupGuide()
    }
    
    func setupNews() {
        newsCollectionView.dataSource = self
        newsCollectionView.delegate = self
        
        let newsNib = UINib(nibName: "NewsCollectionViewCell", bundle: nil)
        newsCollectionView.register(newsNib, forCellWithReuseIdentifier: "NewsCollectionViewCell")
        
        // Carousel 적용
        let layout = UPCarouselFlowLayout()
        layout.itemSize = CGSize(width: newsCollectionView.frame.width, height: 157)
        layout.scrollDirection = .horizontal
        layout.sideItemAlpha = 0.3
        newsCollectionView.collectionViewLayout = layout
        
    }
    
    func setupGuide() {
        guideCollectionView.dataSource = self
        guideCollectionView.delegate = self
        
        let guideNib = UINib(nibName: "GuideCollectionViewCell", bundle: nil)
        guideCollectionView.register(guideNib, forCellWithReuseIdentifier: "GuideCollectionViewCell")
    }
}

extension GuideViewController: UICollectionViewDelegate, UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3 + 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == newsCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCollectionViewCell", for: indexPath) as? NewsCollectionViewCell else { return UICollectionViewCell() }
            
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GuideCollectionViewCell", for: indexPath) as? GuideCollectionViewCell else { return UICollectionViewCell() }
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == newsCollectionView {
            return CGSize(width: 326, height: 157)
        } else {
            return CGSize(width: collectionView.frame.width - 40, height: collectionView.frame.height / 3 - 20)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "GuidelinePage", bundle: nil)
        
        let guideDetailVC = storyboard.instantiateViewController(withIdentifier: "GuideDetailViewController") as! GuideDetailViewController

        
        self.navigationController?.pushViewController(guideDetailVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == newsCollectionView {
            return UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 40)
        } else {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
}
