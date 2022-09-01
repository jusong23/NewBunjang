//
//  SearchVC.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/21.
//

import UIKit

class SearchVC: UIViewController {
    
    var Searches = get_7_2_search ()
    var recommandBrandDataModel = RecommandBrandListDataModel ()

    @IBOutlet var UnderView: UIView!
    @IBOutlet var TopView: UIView!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "RcmdCell", bundle: .main), forCellReuseIdentifier: "RcmdCell")
        gettingSearch()
    }
    
    func gettingSearch() {
        self.Searches.getAddress(accessToken: JwtToken.token,
                                 userIdx:User.Idx, onCompleted: {
            [weak self] result in // 순환 참조 방지, 전달인자로 result
            guard let self = self else { return } // 일시적으로 strong ref가 되게
        
            switch result {
            case let .success(result):
        
                for i in 0..<result.baseResult.brandNameList.count {
                    self.recommandBrandDataModel.inputData(
                        brandName: result.baseResult.brandNameList[i].brandName,
                        brandSubName: result.baseResult.brandNameList[i].brandSubName,
                        imageUrl: result.baseResult.brandNameList[i].imageURL,
                        brandItemCnt: result.baseResult.brandNameList[i].brandItemCnt,
                        isFollowing: result.baseResult.brandNameList[i].isFollowing)
                }
                
                print(result.baseResult.brandNameList.count)
                
            case let .failure(error):
                debugPrint("error \(error)")
            }
        })
    }
        
    
    @IBAction func tapDismissButton(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapToBrand(_ sender: Any) {
        UserDefaults.standard.setValue(1, forKey: "WholeMenuKey")
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "MainCategoryVC") else {return}
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
    
    }
    
}

extension SearchVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RcmdCell", for: indexPath) as? RcmdCell else { return UITableViewCell() }

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 68
    }
}

extension SearchVC : SearchTabBarControllerDelegate {
    func onTabSelected(isTheSame: Bool) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "SearchVC") else {return}
               viewController.modalPresentationStyle = .fullScreen
               self.present(viewController, animated: true, completion: nil)
    }
}
