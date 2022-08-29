//
//  TBCategoryVC.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/21.
//

import UIKit
import Tabman
import Pageboy

class TBCategoryVC: TabmanViewController {
    
    @IBOutlet var tabView: UIView!
    
    private var viewControllers: [UIViewController] = []
    
    var wholeMenuKey = UserDefaults.standard.integer(forKey: "WholeMenuKey")

    override func viewWillAppear(_ animated: Bool) {
        if wholeMenuKey == 1 {
            scrollToIndex(indexOf: 1)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
                
        let Category_category = storyboard?.instantiateViewController(withIdentifier: "Category_category") as! Category_category
        let Category_brand = storyboard?.instantiateViewController(withIdentifier: "Category_brand") as! Category_brand
        let Category_service = storyboard?.instantiateViewController(withIdentifier: "Category_service") as! Category_service
                
        viewControllers.append(Category_category)
        viewControllers.append(Category_brand)
        viewControllers.append(Category_service)
        
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
        addBar(bar, dataSource: self, at: .custom(view: tabView, layout: nil))
    }
}

extension TBCategoryVC: PageboyViewControllerDataSource, TMBarDataSource {
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        switch index {
        case 0:
            return TMBarItem(title: "카테고리")
        case 1:
            return TMBarItem(title: "브랜드")
        case 2:
            return TMBarItem(title: "서비스")
        default:
            let title = "Page \(index)"
           return TMBarItem(title: title)
        }
        print(index)
    }
    
    func scrollToIndex(indexOf:Int) {
        scrollToPage(.at(index: indexOf), animated: false)
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        print(index)
        return viewControllers[index]
    }
    

    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
}
