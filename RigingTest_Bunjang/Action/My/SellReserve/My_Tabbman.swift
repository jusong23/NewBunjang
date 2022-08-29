//
//  My_Tabbman.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/28.
//

import UIKit
import Tabman
import Pageboy

class My_Tabbman: TabmanViewController {

    @IBOutlet var tabView: UIView!
    
    private var viewControllers: [UIViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabMan()
    }
    
    func setUpTabMan() {
        let nowSelling = storyboard?.instantiateViewController(withIdentifier: "NowSelling") as! NowSelling
        let nowReserving = storyboard?.instantiateViewController(withIdentifier: "NowReserving") as! NowReserving
        let completeSelling = storyboard?.instantiateViewController(withIdentifier: "CompleteSelling") as! CompleteSelling
        
        viewControllers.append(nowSelling)
        viewControllers.append(nowReserving)
        viewControllers.append(completeSelling)
     
        self.dataSource = self
        
        let bar = TMBar.ButtonBar()
        // 배경 회색으로 나옴 -> 하얀색으로 바뀜
        bar.backgroundView.style = .blur(style: .light)
        // 간격 설정
        bar.layout.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        // 버튼 글씨 커스텀
        bar.buttons.customize { (button) in
            button.tintColor = .systemGray4
            button.selectedTintColor = .black
            button.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
            button.selectedFont = UIFont.systemFont(ofSize: 15, weight: .semibold)
        }
        // 밑줄 쳐지는 부분
        bar.indicator.weight = .custom(value: 2)
        bar.indicator.tintColor = .black
        addBar(bar, dataSource: self, at: .custom(view: self.tabView, layout: nil))
    }
    
    
}

extension My_Tabbman: PageboyViewControllerDataSource, TMBarDataSource {
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        switch index {
        case 0:
            return TMBarItem(title: "판매중")
        case 1:
            return TMBarItem(title: "예약중")
        case 2:
            return TMBarItem(title: "판매완료")
        default:
            let title = "Page \(index)"
           return TMBarItem(title: title)
        }
    }

    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
}
