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
import CoreData

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 임시로 코어데이터 저장해놓은것 -> 원래 successApi에서 해야함
        let id = "1"
        PersistenceManager.shared.insert(userId: id)
        
        // 코어데이터에 userId 있으면 그냥 넘어감
        let request: NSFetchRequest = User.fetchRequest()
        let fetchResult = PersistenceManager.shared.fetch(request: request)
        
        if fetchResult.count > 0 {
            setUserInfo()
        }

        // 하단 바 숨기기
        self.tabBarController?.tabBar.isHidden = true
    }
    
    
    @IBAction func loginButtonClicked(_ sender: Any) {
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
                        LoginDataManager().loginDataManager(token, self)
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
                          LoginDataManager().loginDataManager(token, self)
                      }
                  }
              }
              
          }
        setUserInfo()
    }
    
    func inputLogin() {
        // 유저정보 저장
//        UserApi.shared.me() { (user, error) in
//            if let error = error {
//                print(error)
//            }
//            else {
//                if let nickname : String = user?.kakaoAccount?.profile?.nickname {
//                    self.inputData.nickName = nickname
//                }
//                if let email: String = user?.kakaoAccount?.email {
//                    print(email)
//                    self.inputData.social = email
//                }
//                print(user?.kakaoAccount?.email)
//            }
//
//            // 서버에 정보 전달
//            print("여기", self.inputData)
//
//        }

    }
    
    func successLogin(_ data: LoginResultModel) {
        print(data)
        PersistenceManager.shared.insert(userId: data.userId)
        //카카오 로그인을 통해 사용자 토큰을 발급 받은 후 사용자 관리 API 호출
        self.setUserInfo()
    }
    
    func setUserInfo() {
        //사용자 관리 api 호출
        UserApi.shared.me() {(user, error) in
            if let error = error {
                print(error)
            }
            else {
                // 로그인한 유저정보 받아와서 무언가 할 것
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                
                let viewController = storyboard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
                
                self.navigationController?.pushViewController(viewController, animated: true)
            }
        }
    }
}
