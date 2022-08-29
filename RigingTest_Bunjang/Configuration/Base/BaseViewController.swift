//
//  BaseViewController.swift
//  EduTemplate - storyboard
//
//  Created by Zero Yoon on 2022/02/23.
//

import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: 아래 예시들처럼 상황에 맞게 활용하시면 됩니다.
        // Navigation Bar
//        self.navigationController?.navigationBar.titleTextAttributes = [
//            .font : UIFont.NotoSans(.medium, size: 16),
//        ]
        // Background Color
//        self.view.backgroundColor = .white
    }
}


// 자주 쓰이는 건 class BaseTabbarController : BaseViewController 이런식으로
// 이 VC를 채택하는 방식 지향
