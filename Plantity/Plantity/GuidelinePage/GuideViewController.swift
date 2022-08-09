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
    
    // dummies
    var guides: [GuideModelResult] = [
        GuideModelResult(title: "초보자도 쉽게할 수 있는 분갈이 방법", subtitle: "분갈이", imageUrl: "urlSample", content: "곽윤기 쇼트트랙 선수는 늘 동료들과 더치페이를 한다고 해요. “짜게구는 이유가 있다고 하는데 저는 정말 공감했거든요. 왜 내 식물만 맨날 죽어가는걸까요? 이런 사람들에게는 문제가 있어요", summary: "식물 🌲 을 키우면 좋은점 : 내 수익/ 손해 액수가 얼마인지 파악하기 쉽다."),
        GuideModelResult(title: "해외주식, 이젠 달러로 볼수 있어요!", subtitle: "투자기초", imageUrl: "urlSample", content: "", summary: ""),
        GuideModelResult(title: "워렌버핏이 이와중에 키우고 있는 식물 🌳", subtitle: "투자기초", imageUrl: "urlSample", content: "", summary: ""),
    ]
    
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
        return guides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == newsCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCollectionViewCell", for: indexPath) as? NewsCollectionViewCell else { return UICollectionViewCell() }
            
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GuideCollectionViewCell", for: indexPath) as? GuideCollectionViewCell else { return UICollectionViewCell() }
            
            let data = guides[indexPath.row]
            
            cell.setupData(imageUrl: data.imageUrl, title: data.title, subtitle: data.subtitle)
            
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
        
        guideDetailVC.guideData = guides[indexPath.row]
        
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
