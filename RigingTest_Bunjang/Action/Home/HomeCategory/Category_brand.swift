//
//  Category_brand.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/21.
//

import UIKit

class Category_brand: UIViewController {

    var GetBrands = get_8_1_brands ()
    var MyFollow = get_8_2_MyFollow ()
    var PostBrandFollow = post_15_1 ()
    var BrandsDataModel = BrandListDataModel ()
    var MyFollwingDataModel = MyFollwingListDataModel ()
    
    var MyFollowingCheck = 0
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var myFollowing: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "RcmdCell", bundle: .main), forCellReuseIdentifier: "RcmdCell")
        gettingBrands()
    }
    
    @IBAction func MyFollowingButton(_ sender: Any) {
        if self.myFollowing.isSelected == false {
            self.myFollowing.isSelected = true
            self.myFollowing.tintColor = .mainRed
            self.myFollowing.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .selected)
            gettingMyFollow()
            self.MyFollowingCheck = 1
        } else {
            self.myFollowing.isSelected = false
            self.myFollowing.tintColor = .lightGray
            self.myFollowing.setImage(UIImage(systemName: "checkmark.circle"), for: .selected)
            self.MyFollowingCheck = 0
            self.tableView.reloadData()
        }
    }
    
    public func Follow() {
        let alert = UIAlertController(title: "성공", message: "브랜드 팔로우가 완료되었습니다.", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in }
        alert.addAction(okAction)
        present(alert, animated: false, completion: nil)
    }
    
    public func UnFollow() {
        let alert = UIAlertController(title: "성공", message: "브랜드 팔로우가 해지되었습니다.", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in }
        alert.addAction(okAction)
        present(alert, animated: false, completion: nil)
    }
    
    func gettingMyFollow() {
        self.MyFollow.getMyFollow(accessToken: JwtToken.token ?? "", userIdx: User.Idx ?? "", onCompleted: {
            [weak self] result in // 순환 참조 방지, 전달인자로 result
            guard let self = self else { return } // 일시적으로 strong ref가 되게
        
            switch result {
            case let .success(result):
        
                self.MyFollwingDataModel.removeData()

                
                for i in 0..<result.baseResult.count {
                    
                    self.MyFollwingDataModel.inputData(
                        brandIdx: result.baseResult[i].brandRes.brandIdx,
                        brandName: result.baseResult[i].brandRes.brandName,
                        brandSubName: result.baseResult[i].brandRes.brandSubName,
                        brandItemCount: result.baseResult[i].brandRes.brandItemCount,
                        isFollowCheck: result.baseResult[i].brandRes.isFollowCheck,
                        storeImageUrl: result.baseResult[i].brandRes.storeImageURL)
                    
                    }
        
                self.tableView.reloadData()
                
                
            case let .failure(error):
                debugPrint("error \(error)")
            }
        })
    }
    
    @IBAction func tapToSearchButton(_ sender: Any) {
        print("it work")

        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "SearchDetailVC") else {return}
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
    }
    
    func gettingBrands() {
        self.GetBrands.getBrands(accessToken: JwtToken.token ?? "", userIdx: User.Idx ?? "", onCompleted: {
            [weak self] result in // 순환 참조 방지, 전달인자로 result
            guard let self = self else { return } // 일시적으로 strong ref가 되게
        
            switch result {
            case let .success(result):
        
                for i in 0..<result.baseResult.count {
                    self.BrandsDataModel.inputData(
                        brandIdx: result.baseResult[i].brandIdx,
                        brandName: result.baseResult[i].brandName,
                        brandSubName: result.baseResult[i].brandSubName,
                        brandItemCount: result.baseResult[i].brandItemCount,
                        isFollowCheck: result.baseResult[i].isFollowCheck,
                        storeImageUrl: result.baseResult[i].storeImageURL)
                    }
        
                self.tableView.reloadData()
                print(result.baseResult.count)
        
            case let .failure(error):
                debugPrint("error \(error)")
            }
        })
    }
    
}

extension Category_brand: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        var cellBrandIdx = self.BrandsDataModel.getBrandIdx(index: indexPath.row)

        self.PostBrandFollow.post_15_1_BrandFollow(accessToken: JwtToken.token ?? "", userIdx: User.Idx ?? "", brandIdx: cellBrandIdx)
        
        var FollowingCheck = FollowingCheck.Key
        
        if FollowingCheck == 1 {
            UnFollow()
        } else {
            Follow()
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.MyFollowingCheck == 1 {
            return self.MyFollwingDataModel.count
        }
        
        return self.BrandsDataModel.count
            
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RcmdCell", for: indexPath) as? RcmdCell else { return UITableViewCell() }

        var cellBrandName = self.BrandsDataModel.getBrandName(index: indexPath.row)
        var cellBrandSubName = self.BrandsDataModel.getBrandSubName(index: indexPath.row)
        var cellImageUrl = self.BrandsDataModel.getStoreImageUrl(index: indexPath.row)
        var cellBrandItemCnt = self.BrandsDataModel.getBrandItemCount(index: indexPath.row)
        
        
        cell.brandName.text = cellBrandName
        cell.brandSubName.text = cellBrandSubName
        cell.brandItemCnt.text = cellBrandItemCnt
        
        if self.MyFollowingCheck == 1 {
            cell.brandName.text = self.MyFollwingDataModel.getBrandName(index: indexPath.row)
            cell.brandSubName.text = self.MyFollwingDataModel.getBrandSubName(index: indexPath.row)
            cell.brandItemCnt.text = self.MyFollwingDataModel.getBrandItemCount(index: indexPath.row)
            
            var cellImageUrl = self.MyFollwingDataModel.getStoreImageUrl(index: indexPath.row)
            
            var url = URL(string: cellImageUrl ?? "")
            
            var fakeUrl = URL(string: "https://cdn1.domeggook.com/upload/item/2022/08/17/1660728672D2FC60FB94167B9A7FBEE4/1660728672D2FC60FB94167B9A7FBEE4_stt_150.png?hash=c816d722ffe0ddd7f0f464b7056047fc")
            
            cell.brandImage.load_8_1(url_8_1: (url ?? fakeUrl)!)
        }
        
        var url = URL(string: cellImageUrl ?? "")
        
        var fakeUrl = URL(string: "https://cdn1.domeggook.com/upload/item/2022/08/17/1660728672D2FC60FB94167B9A7FBEE4/1660728672D2FC60FB94167B9A7FBEE4_stt_150.png?hash=c816d722ffe0ddd7f0f464b7056047fc")
        
        cell.brandImage.load_8_1(url_8_1: (url ?? fakeUrl)!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 68
    }
}

extension UIImageView {
    func load_8_1(url_8_1: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url_8_1) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

