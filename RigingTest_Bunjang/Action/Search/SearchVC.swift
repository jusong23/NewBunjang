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

    @IBOutlet weak var SearchWord: UILabel!
    
    @IBOutlet weak var LabelView: UIView!
    @IBOutlet var UnderView: UIView!
    @IBOutlet var TopView: UIView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var TopAnchorForMainView: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
            
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "RcmdCell", bundle: .main), forCellReuseIdentifier: "RcmdCell")
        gettingSearch()
        InitialSearch()
    }
    
    func aboutLabel() {
        self.SearchWord.sizeToFit()
    }
    
    func InitialSearch() {
        self.TopAnchorForMainView.constant = 0
        self.LabelView.isHidden = true
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
                
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    
                    self.SearchWord.text = result.baseResult.searchList.last?.searchText
                }
                
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
        return self.recommandBrandDataModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RcmdCell", for: indexPath) as? RcmdCell else { return UITableViewCell() }

        var cellBrandName = self.recommandBrandDataModel.getBrandName(index: indexPath.row)
        var cellBrandSubName = self.recommandBrandDataModel.getBrandSubName(index: indexPath.row)
        var cellImageUrl = self.recommandBrandDataModel.getImageUrl(index: indexPath.row)
        var cellBrandItemCnt = self.recommandBrandDataModel.getBrandItemCnt(index: indexPath.row)
        
        cell.brandName.text = cellBrandName
        cell.brandSubName.text = cellBrandSubName
        cell.brandItemCnt.text = cellBrandItemCnt
        
        var url = URL(string: cellImageUrl ?? "")
        
        var fakeUrl = URL(string: "https://cdn1.domeggook.com/upload/item/2022/08/17/1660728672D2FC60FB94167B9A7FBEE4/1660728672D2FC60FB94167B9A7FBEE4_stt_150.png?hash=c816d722ffe0ddd7f0f464b7056047fc")
        
        cell.brandImage.load_7_3(url_7_3: (url ?? fakeUrl)!)

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

extension UIImageView {
    func load_7_3(url_7_3: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url_7_3) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
