//
//  MainViewController.swift
//  Plantity
//
//  Created by 최은형 on 2022/08/08.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        self.navigationController?.navigationBar.isHidden = true

        self.selectedIndex = 2

    }

}
