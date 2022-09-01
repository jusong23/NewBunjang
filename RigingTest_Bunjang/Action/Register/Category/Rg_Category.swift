//
//  Rg_Category.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/22.
//

import UIKit

class Rg_Category: UIViewController {
    
    var CategoryList = ["여성의류","남성의류","신발","가방","시계/주얼리","패션 액세서리","디지털/가전","스포츠/레저","차량/오토바이","스타굿즈","키덜트","에술/희귀/수집품","음반/악기","도서/티켓/문구","뷰티/미용","가구/인테리어","생활/가공식품","유아동/출산","반려동물용품","기타","지역 서비스","원룸/함께살아요","번개니눔","구인구직","재능","커뮤니티"]
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "Rg_Cell", bundle: .main), forCellReuseIdentifier: "Rg_Cell")
    }
    
    @IBAction func tapBackButton(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
}



extension Rg_Category: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.CategoryList.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "전체"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Rg_Cell", for: indexPath) as? Rg_Cell else { return UITableViewCell() }
        
        cell.Category.text = self.CategoryList[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    
}
