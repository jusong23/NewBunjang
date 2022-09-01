//
//  sign-up.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/23.
//

import Foundation
import Security
import Alamofire


// MARK: - [POST] 1.1 전화번호로 회원가입 /app/users/sign-up

class post_1_1 {
        
    func post_1_1_SignUp(userName:String, phoneNumber:String, birth: String ) {
            let Testurl = URL(string: "https://prod.jinsoo.shop/app/users/sign-up")!

            var profile = SignUp(userName: userName, phoneNumber: phoneNumber, birth: birth)
            
            guard let jsonData = try? JSONEncoder().encode(profile) else {
                print("error: cannot encode data")
                return
            }
            print(jsonData)
            
            var request1 = URLRequest(url: Testurl)
            request1.httpMethod = "POST"
            request1.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request1.setValue("application/json", forHTTPHeaderField: "Accept")

            request1.httpBody = jsonData
            
            
            URLSession.shared.dataTask(with: request1) { (data, response, error) in
                guard error == nil else {
                    print("error at first")
                    print(error)
                    return
                }
                
                guard let data = data else {
                    print("error at data")
                    return
                }
                
                guard let response = response else {
                    print("error at response")
                    return
                }
                
                do { // 요청 O 응답 O
                    let decoder = JSONDecoder()
                    // json 객체에서 data 유형의 인스턴스로 디코딩하는 객체! Decodable, Codable 프로토콜을 준수하는 라인!
                    let result = try decoder.decode(SignedUpInfo.self, from: data)

                    if let UserIdx = result.baseResult.userIdx as? Int,
                       let UserToken = result.baseResult.jwt as? String {
                        User.Idx = String(UserIdx)
                        JwtToken.token = UserToken
                    }
                    print(result.message)
                }
                

                catch {
                    print("error while print json")
                }

            }.resume()
        }

}
