//
//  GuideDetailViewController.swift
//  Plantity
//
//  Created by 최은형 on 2022/07/29.
//

import UIKit

class GuideDetailViewController: UIViewController {
    @IBOutlet weak var detailView: UIView!
    
    @IBOutlet weak var summaryView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAttribute()
    }

    func setupAttribute() {
        detailView.layer.cornerRadius = 20
        detailView.clipsToBounds = true
        
        summaryView.layer.cornerRadius = 20
        summaryView.clipsToBounds = true
    }
    
    @IBAction func backButtonClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
