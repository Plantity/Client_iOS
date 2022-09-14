//
//  GuideDetailViewController.swift
//  Plantity
//
//  Created by 최은형 on 2022/07/29.
//

import UIKit

class GuideDetailViewController: UIViewController {
    @IBOutlet weak var detailView: UIView!
    
    //@IBOutlet weak var summaryView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentStack: UIStackView!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    //@IBOutlet weak var summaryLabel: UILabel!
    
    @IBOutlet weak var subtitleLabel2: UILabel!
    @IBOutlet weak var contentLabel2: UILabel!
    
    @IBOutlet weak var subtitleLabel3: UILabel!
    @IBOutlet weak var contentLabel3: UILabel!
    
    var guideData: GuideModelResult = GuideModelResult(title: "", subtitle: "", content: [])
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAttribute()
        setupData(title: guideData.title, subtitle: guideData.subtitle, content: guideData.content)
    }

    func setupAttribute() {
        detailView.layer.cornerRadius = 20
        detailView.clipsToBounds = true
        
        //summaryView.layer.cornerRadius = 20
        //summaryView.clipsToBounds = true
    }
    
    func setupData(title: String?, subtitle: String?, content: [GuideContentModel]?) {
        if let titleStr: String = title {
            titleLabel.text = titleStr
        }
        if let contentArray: [GuideContentModel] = content {
            subtitleLabel.text = contentArray[0].subtitle
            contentLabel.text = contentArray[0].text
            
            subtitleLabel2.text = contentArray[1].subtitle
            contentLabel2.text = contentArray[1].text
            
            subtitleLabel3.text = contentArray[2].subtitle
            contentLabel3.text = contentArray[2].text
        }
    }
    
    @IBAction func backButtonClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
