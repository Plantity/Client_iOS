//
//  TestViewController.swift
//  Plantity
//
//  Created by 김다연 on 2022/07/29.
//

import UIKit

class TestViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    
    var order: Int = 0
    var mbti: [Int] = [0, 0, 0, 0]
    let tests : [TestModel] = [
        TestModel(test: """
반려식물을 들여요기로 결정한
당신이 처음으로 하는 일은?
""",
                  answer1: "키우는 방법부터 검색해본다.",
                  answer2: "이름부터 지어준다."),
        TestModel(test: """
둘 중 더 키우고 싶은
식물을 고른다면?
""",
                  answer1: "무늬가 알록달록한 식물",
                  answer2: "사람들이 많이 키우는 식물"),
        TestModel(test: """
식물과 함께하는 아침,
뭐부터 먼저할까?
""", answer1: "커튼을 걷어 햇살이 잘 들어오도록 한다.", answer2: "Plantity를 열어 오늘의 과제는 무엇인지 확인한다."),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func firstClicked(_ sender: UIButton) {
        if order == tests.count - 1 {
            //스토리보트 생성
            let storyboard = UIStoryboard(name: "TestPage", bundle: nil)
            
            //뷰컨생성
            let resultViewController = storyboard.instantiateViewController(withIdentifier: "TestResultViewController")as! TestResultViewController
            resultViewController.result = self.mbti
            
            //화면전환메소드 이용
            self.navigationController?.pushViewController(resultViewController, animated: true)
        } else {
            order += 1
            mbti[order] += 1
            questionLabel.text = tests[order].test
            answer1Button.setTitle(tests[order].answer1, for: .normal)
            answer2Button.setTitle(tests[order].answer2, for: .normal)
        }
    }
    
    @IBAction func secondClicked(_ sender: Any) {
        if order == tests.count - 1 {
            //스토리보트 생성
            let storyboard = UIStoryboard(name: "TestPage", bundle: nil)
            
            //뷰컨생성
            let resultViewController = storyboard.instantiateViewController(withIdentifier: "TestResultViewController")as! TestResultViewController
            resultViewController.result = self.mbti
            
            //화면전환메소드 이용
            self.navigationController?.pushViewController(resultViewController, animated: true)
        } else {
            order += 1
            mbti[order] -= 1
            questionLabel.text = tests[order].test
            answer1Button.setTitle(tests[order].answer1, for: .normal)
            answer2Button.setTitle(tests[order].answer2, for: .normal)
        }
    }

}
