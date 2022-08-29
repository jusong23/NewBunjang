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

func postSignUp(userName:String, phoneNumber:String, birth: String) {
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
            
            do {
                guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                    print("error cannot convert json")
                    return
                }
                
                print(jsonObject["message"])
                
                
               
            } catch {
                print("error while print json")
            }

        }.resume()
    }

