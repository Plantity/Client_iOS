//
//  TestStartViewController.swift
//  Plantity
//
//  Created by 김다연 on 2022/07/29.
//

import UIKit

class TestStartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func testStartButton(_ sender: Any) {
        //화면전환
        //스토리보트 생성
        let storyboard = UIStoryboard(name: "TestPage", bundle: nil)
        
        //뷰컨생성
        let testViewController = storyboard.instantiateViewController(withIdentifier: "TestViewController")as! TestViewController
        //화면전환메소드 이용
        self.navigationController?.pushViewController(testViewController, animated: true)
    }
    

    @IBAction func skipButtonClicked(_ sender: UIButton) {
        // 메인화면으로 스킵
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        //뷰컨생성
        let mainViewController = storyboard.instantiateViewController(withIdentifier: "MainViewController")as! MainViewController
        //화면전환메소드 이용
        self.navigationController?.pushViewController(mainViewController, animated: true)
    }
    
}
