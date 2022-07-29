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
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func testStartButton(_ sender: Any) {
        //화면전환
        //스토리보트 생성
        let storyboard = UIStoryboard(name: "TestViewController", bundle: nil)
        
        //뷰컨생성
        let TestViewController = storyboard.instantiateViewController(withIdentifier: "TestViewController")as! TestViewController
        //화면전환메소드 이용
        self.present(TestViewController, animated: true, completion: nil)
    }
    


}
