//
//  LoginViewController.swift
//  Plantity
//
//  Created by 최은형 on 2022/09/06.
//

import UIKit
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 하단 바 숨기기
        self.tabBarController?.tabBar.isHidden = true
    }
    
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        var accessToken: String = ""
        // 카카오톡 설치 여부 확인
          if (UserApi.isKakaoTalkLoginAvailable()) {
            // 카카오톡 로그인. api 호출 결과를 클로저로 전달.
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    // 예외 처리 (로그인 취소 등)
                    print(error)
                }
                else {
                    if let token : String = oauthToken?.accessToken {
                        accessToken = token
                    }
                }
            }
          } else {
              // 카카오톡 안깔려 있을경우 웹으로 로그인
              UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                  if let error = error {
                      print(error)
                  }
                  else {
                      if let token : String = oauthToken?.accessToken {
                          accessToken = token
                      }
                      self.setUserInfo()
                  }
              }
          }
        // 서버에 토큰 전달
        // ***
        
        print(accessToken)
        
        //카카오 로그인을 통해 사용자 토큰을 발급 받은 후 사용자 관리 API 호출
    }
    
    func setUserInfo() {
        //사용자 관리 api 호출
        UserApi.shared.me() {(user, error) in
            if let error = error {
                print(error)
            }
            else {
                print("me() success.")
                // 로그인한 유저정보 받아와서 무언가 할 것
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                
                let viewController = storyboard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
                
                self.navigationController?.pushViewController(viewController, animated: true)
            }
        }
    }
}
