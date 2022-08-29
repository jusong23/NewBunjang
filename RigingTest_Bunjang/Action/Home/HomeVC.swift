//
//  HomeVC.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/20.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var bannerCollectionView: UICollectionView!
    @IBOutlet var nowImageCount: UILabel!
    @IBOutlet var freakNavigationBar: UIView!
    @IBOutlet var list: UIButton!

    @IBOutlet var zzeamButton: UIButton!
    @IBOutlet var lastSeenButton: UIButton!

    @IBOutlet var search: UIButton!
    @IBOutlet var bell: UIButton!
    
    var nowPage: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        bannerTimer()
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        navigationSetting()
        tabBarController?.tabBar.isHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = false
    }
    
    @IBAction func tapToCategoryButton(_ sender: Any) {
        UserDefaults.standard.setValue(0, forKey: "WholeMenuKey")
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "MainCategoryVC") else {return}
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
    }
    
    func navigationSetting() {
        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func tapToZzeam(_ sender: Any) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeCategoryVC") else { return }
            self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func tapToLastSeen(_ sender: Any) {
        UserDefaults.standard.setValue(1, forKey: "InterestingKey")
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeCategoryVC") else { return }
            self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func bannerTimer() {
        let _: Timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { (Timer) in
            self.bannerMove()
        }
    }
    
    func bannerMove() {
        // 현재페이지가 마지막 페이지일 경우
        if self.nowPage == dataArray.count - 1 {
        // 맨 처음 페이지로 돌아감
            self.nowImageCount.text = "1"
            bannerCollectionView.isPagingEnabled = false
            bannerCollectionView.scrollToItem(at: NSIndexPath(item: 0, section: 0) as IndexPath, at: .right, animated: true)
            bannerCollectionView.isPagingEnabled = true
            self.nowPage = 0
            return
        }
        // 다음 페이지로 전환
        self.nowPage += 1
        self.nowImageCount.text = String(nowPage + 1)

        bannerCollectionView.isPagingEnabled = false
        bannerCollectionView.scrollToItem(at: NSIndexPath(item: nowPage, section: 0) as IndexPath, at: .right, animated: true)
        bannerCollectionView.isPagingEnabled = true
    }
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    //컬렉션뷰 개수 설정
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    //컬렉션뷰 셀 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = bannerCollectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as! BannerCell
        cell.imgView.image = dataArray[indexPath.row]
        return cell
    }
    
    // UICollectionViewDelegateFlowLayout 상속
    //컬렉션뷰 사이즈 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: bannerCollectionView.frame.size.width  , height:  bannerCollectionView.frame.height)
    }
    
    //컬렉션뷰 감속 끝났을 때 현재 페이지 체크
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        nowPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}

extension HomeVC: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    
//        print(self.scrollView.contentOffset.y)
        
        let nowScrollOffset = self.scrollView.contentOffset.y
                
//        self.freakNavigationBar.alpha = (47 + nowScrollOffset) * 100 / 47
    }
}

