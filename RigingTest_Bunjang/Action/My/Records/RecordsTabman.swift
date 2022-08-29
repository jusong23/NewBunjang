//
//  RecordsTabman.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/28.
//

import UIKit
import Tabman
import Pageboy

class RecordsTabman: TabmanViewController {
    
    private var viewControllers: [UIViewController] = []
    
    @IBOutlet var tabView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let buyVC = storyboard?.instantiateViewController(withIdentifier: "BuyVC") as! BuyVC
        let sellVC = storyboard?.instantiateViewController(withIdentifier: "SellVC") as! SellVC
        let moneyVC = storyboard?.instantiateViewController(withIdentifier: "MoneyVC") as! MoneyVC

        viewControllers.append(buyVC)
        viewControllers.append(sellVC)
        viewControllers.append(moneyVC)
        
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
        self.navigationController?.popViewController(animated: true)
    }
}


extension RecordsTabman: PageboyViewControllerDataSource, TMBarDataSource {
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        switch index {
        case 0:
            return TMBarItem(title: "구매")
        case 1:
            return TMBarItem(title: "판매")
        case 2:
            return TMBarItem(title: "정산")
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
        
        
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
}
