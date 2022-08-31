//
//  TalkVC.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/22.
//

import UIKit

class TalkVC: UIViewController {

    var ChatRooms = get_10_3_chatRoom ()
    var ChatRoomDataModel = ChatRoomListDataModel ()
    
    @IBOutlet weak var AddImage: UIImageView!
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "TalkCell", bundle: .main), forCellReuseIdentifier: "TalkCell")
        gettingChatRoom()
    }
    
func gettingChatRoom() {
    self.ChatRooms.getChathRoom(accessToken: JwtToken.token, onCompleted: {
        [weak self] result in // 순환 참조 방지, 전달인자로 result
        guard let self = self else { return } // 일시적으로 strong ref가 되게
    
        switch result {
        case let .success(result):
    
            for i in 0..<result.baseResult.count {
                self.ChatRoomDataModel.inputData(
                    storeImageUrl: result.baseResult[i].storeName,
                    storeName: result.baseResult[i].storeName,
                    period: result.baseResult[i].period,
                    lastChat: result.baseResult[i].lastChat)
            }
    
            self.tableView.reloadData()
            print(result.baseResult.count)
    
        case let .failure(error):
            debugPrint("error \(error)")
        }
    })
}
    
}

extension TalkVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ChatRoomDataModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TalkCell", for: indexPath) as? TalkCell else { return UITableViewCell() }

        var cellImageUrl = self.ChatRoomDataModel.getStoreImageUrl(index: indexPath.row)
        var cellStoreName = self.ChatRoomDataModel.getStoreName(index: indexPath.row)
        var cellPeriod = self.ChatRoomDataModel.getPeriod(index: indexPath.row)
        var cellILastChat = self.ChatRoomDataModel.getLastChat(index: indexPath.row)
        
        var url = URL(string: cellImageUrl ?? "")
        
        var fakeUrl = URL(string: "https://cdn1.domeggook.com/upload/item/2022/08/17/1660728672D2FC60FB94167B9A7FBEE4/1660728672D2FC60FB94167B9A7FBEE4_stt_150.png?hash=c816d722ffe0ddd7f0f464b7056047fc")
        
        if cellImageUrl != "이미지 없음" {
            cell.StoreImage.load_10_3(url_10_3: (url ?? fakeUrl)!)
        }
        
        cell.StoreName.text = cellStoreName
        cell.Period.text = cellPeriod
        cell.LastChat.text = cellILastChat
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 68
    }


}

extension UIImageView {
    func load_10_3(url_10_3: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url_10_3) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

