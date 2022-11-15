//
//  TestResultViewController.swift
//  Plantity
//
//  Created by 최은형 on 2022/10/06.
//

import UIKit

class TestResultViewController: UIViewController {
    
    var result : [Int] = [0, 0, 0, 0]

    override func viewDidLoad() {
        super.viewDidLoad()
        print(result)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func goButtonClicked(_ sender: UIButton) {
        // 메인화면으로
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        //뷰컨생성
        let mainViewController = storyboard.instantiateViewController(withIdentifier: "MainViewController")as! MainViewController
        //화면전환메소드 이용
        self.navigationController?.pushViewController(mainViewController, animated: true)
    }

}
