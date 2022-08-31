//
//  TalkVC.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/22.
//

import UIKit

class TalkVC: UIViewController {

    @IBOutlet weak var AddImage: UIImageView!
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "TalkCell", bundle: .main), forCellReuseIdentifier: "TalkCell")
        
    }
    
    
}

extension TalkVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TalkCell", for: indexPath) as? TalkCell else { return UITableViewCell() }

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 68
    }


}
