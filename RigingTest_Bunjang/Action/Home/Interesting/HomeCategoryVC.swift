//
//  HomeCategoryVC.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/21.
//

import UIKit
import Tabman
import Pageboy

class HomeCategoryVC: TabmanViewController {
    
    private var viewControllers: [UIViewController] = []
    var interestingKey = UserDefaults.standard.integer(forKey: "InterestingKey")
    
    @IBOutlet var plus: UIButton!
    @IBOutlet var filter: UIButton!
    @IBOutlet var tabView: UIView!
    @IBOutlet var modify: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        if interestingKey == 1 {
            scrollToIndex(indexOf: 1)
        }
    }
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            let ZzeamVC = storyboard?.instantiateViewController(withIdentifier: "ZzeamVC") as! ZzeamVC
            let LastSeenVC = storyboard?.instantiateViewController(withIdentifier: "LastSeenVC") as! LastSeenVC
                    
            viewControllers.append(ZzeamVC)
            viewControllers.append(LastSeenVC)
            
            self.dataSource = self
            let bar = TMBar.ButtonBar()
            bar.layout.contentMode = .fit
            bar.layout.alignment = .centerDistributed
            // 배경 회색으로 나옴 -> 하얀색으로 바뀜
            bar.backgroundView.style = .blur(style: .light)
            // 간격 설정
            bar.layout.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
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

    @IBAction func tapBackButton(_ sender: Any) {
        UserDefaults.standard.set(0, forKey: "InterestingKey")
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension HomeCategoryVC: PageboyViewControllerDataSource, TMBarDataSource {
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        switch index {
        case 0:
            return TMBarItem(title: "찜")
        case 1:
            return TMBarItem(title: "최근 본 상품")
        default:
            let title = "Page \(index)"
           return TMBarItem(title: title)
            
        }
    }

    func scrollToIndex(indexOf:Int) {
        scrollToPage(.at(index: indexOf), animated: false)
    }
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        UserDefaults.standard.setValue(index, forKey: "PageNumber")
        
        var pageNumber = UserDefaults.standard.integer(forKey: "PageNumber")
        
        if pageNumber == 0 {
            self.plus.isHidden = false
            self.filter.isHidden = false
            self.modify.isHidden = true
        } else {
            self.plus.isHidden = true
            self.filter.isHidden = true
            self.modify.isHidden = false
        }

        
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
}
