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
        GuideModelResult(
            title: "왕초보 식집사를 위한 기본 지식",
            subtitle: "식물 키우기가 처음이라면",
            content: [GuideContentModel(subtitle: "물은 언제 줘야 하나요?", text: "흙을 손가락으로 만져보세요! 흙이 축축하다면 물을 주지 않아도 괜찮습니다. 식믈이 죽는 대부분의 이유는 바로 ‘과습’ 때문이라고 합니다. 과습이 되지 않도록 흙이 말랐다 싶을 때 물을 충분히 주세요. 단, 이는 식물마다 다르기 때문에 내가 키우는 식물에 대한 정보를 꼼꼼하게 체크해 보아야 합니다. 흙을 직접 만져보는 것 외에도, 육안상으로 잎이 쭈글쭈글하다 싶으면 물을 주는 방법도 있습니다."), GuideContentModel(subtitle: "식물을 어디에 둬야할까요?", text: "식물들은 대부분 햇빛을 좋아합니다. 가급적 빛이 잘 들어오는 곳에 두되, 햇빛을 직접적으로 쐬는 것은 피해주세요. 12시간 이상 빛을 쐬는 것이 좋습니다. 또한 식물은 주변 환경에 느리게 적응하기 때문에 자주 움직이지 않도록 유의해주세요. 선인장이 아닌 식물이라면 방을 습하게 유지해주는 게 베스트!"), GuideContentModel(subtitle: "가지치기하는 방법", text: "처음이라 가지치기가 어려운 가드너님을 위해. 때로는 마음이 아플 수도 있지만, 가지치기를 해주지 않으면 식물은 끝없이 자라서 뿌리가 화분 밑으로 나올 수 있습니다. 죽은 가지나 줄기는 벌레가 생길 수도 있으니 잘라내주세요. 가지를 자를 때에는 45˚ 각도로 잘라서 건강하게 자랄 수 있게 해주세요.")]),
        GuideModelResult(
            title: "실내식물 가지치기 하는 방법",
            subtitle: "",
            content: [GuideContentModel(subtitle: "1. 죽은 잎과 가지, 꽃 제거", text: "무딘 가위를 사용할 경우 식물이 손상될 수 있으므로 날카로운 가위 또는 전지 가위를 사용해야 합니다. 꽃이 피는 실내식물인 경우 꽃이 필 때까지 기다린 후에 가지치기를 하고, 꽃이 피지 않는 실내식물인 경우 늦겨울에 가지치기를 하면 좋습니다. 변색 또는 갈변한 잎과 가지들을 가위를 사용해 그 부분 바로 밑을 45도 각도로 자르세요."), GuideContentModel(subtitle: "2. 지나치게 많이 자란 가지와 줄기 잘라내기", text: "가위를 사용해 가지 길이의 1/3 정도를 잘라내세요. 가지치기를 너무 많이 하면 식물이 제대로 성장하기 힘듭니다. 한번 할 때마다 잎과 줄기를 선택적으로 10~20%만 잘라내세요."), GuideContentModel(subtitle: "3. 실내식물 관리하기", text: "가지치기를 한 뒤 용해성이 있는 다목적 비료를 주세요. 잎이 크고 넓은 실내식물에는 때와 먼지가 쌓일 수 있으니 축축한 스펀지 또는 걸레로 닦아내 관리하세요. 흙 속에 손가락을 약 2.5cm 깊이 만큼 넣어 흙이 축축하지 않을 경우 물을 주세요.")]),
        GuideModelResult(
            title: "과습된 식물 살리는 방법",
            subtitle: "걱정이 지나쳐 물을 자주주게 돼요.",
            content: [GuideContentModel(subtitle: "과습 여부 파악하기", text: "잎이 연한 녹색이거나 노란색이면 과습이라는 뜻입니다. 화분 바닥에 물이 고여있지 않은지 확인하세요. 흙 색깔도 확인해보세요. 녹색이라면 새로 사야합니다."), GuideContentModel(subtitle: "과습 식물 살리기", text: "식물을 그늘진 곳에 둡니다. 식물을 화분 밖에 몇 시간 내지 반나절 동안 두었다가 물 빠지는 구멍이 있는 화분을 새로 구해 다시 심어주세요."), GuideContentModel(subtitle: "과습 후 관리하기", text: "물은 흙 표면이 마를 때에만 주세요. 식물이 완전히 되살아나면 물을 7-10번 줄 때마다 한 번 비료를 줍니다.")]),
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
            
            cell.setupData(title: data.title, subtitle: data.subtitle)
            
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
