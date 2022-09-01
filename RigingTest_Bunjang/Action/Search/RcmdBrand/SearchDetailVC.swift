//
//  SearchDetailVC.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/09/01.
//

import UIKit

class SearchDetailVC: UIViewController {

    var SearchBrands = get_8_2_SearchBrands ()
    var SearchedDataModel = SearchedListDataModel ()
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "RcmdCell", bundle: .main), forCellReuseIdentifier: "RcmdCell")
    }
    
    @IBAction func DoSearch(_ sender: Any) {
        
        var SearchWord = self.searchTextField.text ?? ""

        self.SearchBrands.getSearchBrands(accessToken: JwtToken.token ?? "", searchWord: SearchWord, onCompleted: {
            [weak self] result in // 순환 참조 방지, 전달인자로 result
            guard let self = self else { return } // 일시적으로 strong ref가 되게
        
            switch result {
            case let .success(result):
            
            for i in 0..<result.baseResult.count {
                if result.baseResult[i].brandName == SearchWord {
                    
                    self.SearchedDataModel.removeData()
                    
                    self.SearchedDataModel.inputData(
                        brandIdx: result.baseResult[i].brandIdx,
                        brandName: result.baseResult[i].brandName,
                        brandSubName: result.baseResult[i].brandSubName,
                        brandItemCount: result.baseResult[i].brandItemCount,
                        isFollowCheck: result.baseResult[i].isFollowCheck,
                        storeImageUrl: result.baseResult[i].storeImageURL)
                    self.tableView.reloadData()
                }
            }
            
            case let .failure(error):
                debugPrint("error \(error)")
            }
        })
                
    }
    
    @IBAction func tapBackButton(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
}


extension SearchDetailVC: UITableViewDataSource, UITableViewDelegate {
        
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.SearchedDataModel.count
            
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RcmdCell", for: indexPath) as? RcmdCell else { return UITableViewCell() }

        var cellBrandName = self.SearchedDataModel.getBrandName(index: indexPath.row)
        var cellBrandSubName = self.SearchedDataModel.getBrandSubName(index: indexPath.row)
        var cellImageUrl = self.SearchedDataModel.getStoreImageUrl(index: indexPath.row)
        var cellBrandItemCnt = self.SearchedDataModel.getBrandItemCount(index: indexPath.row)
        
        cell.brandName.text = cellBrandName
        cell.brandSubName.text = cellBrandSubName
        cell.brandItemCnt.text = cellBrandItemCnt
        

        
        var url = URL(string: cellImageUrl ?? "")
        
        var fakeUrl = URL(string: "https://cdn1.domeggook.com/upload/item/2022/08/17/1660728672D2FC60FB94167B9A7FBEE4/1660728672D2FC60FB94167B9A7FBEE4_stt_150.png?hash=c816d722ffe0ddd7f0f464b7056047fc")
        
        cell.brandImage.load_8_2(url_8_2: (url ?? fakeUrl)!)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 68
    }
}

extension UIImageView {
    func load_8_2(url_8_2: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url_8_2) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
