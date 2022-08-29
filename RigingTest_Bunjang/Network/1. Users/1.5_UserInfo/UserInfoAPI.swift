//
//  items.swift
//  RigingTest_Bunjang
//
//  Created by 이주송 on 2022/08/24.
//

import Foundation
import Security
import Alamofire

// MARK: - [GET] 2.4 상품 목록 가져오기(최신순) /items
class get_1_5_UserInfo{
    func getUserInfo(accessToken:String, userIdx:String, onCompleted: @escaping (Result<UserInfo,Error>)-> Void) {
        let url = "https://prod.jinsoo.shop/app/users/\(userIdx)?salesStatus=0"
        AF.request(url,
                   method:.get, // 어떤 통신방식을 사용할 지
                   parameters: nil, // 서버로 보낼 parameter를 담는 것(POST)
                   encoding: URLEncoding.default, // URL을 통해 접근할 것이니 URLEncoding
                   headers: ["X-ACCESS-TOKEN":accessToken]) // json 형식으로 받게끔
        .validate(statusCode: 200..<500) // 에러여부
        .responseData(completionHandler: { response in // 응답데이터를 받을수 있는 메소드를 Chaning
            switch response.result { // 요청에 대한 응답 결과
            case let .success(data): // 요청 O
                do { // 요청 O 응답 O
                    let decoder = JSONDecoder()
                    // json 객체에서 data 유형의 인스턴스로 디코딩하는 객체! Decodable, Codable 프로토콜을 준수하는 라인!
                    let result = try decoder.decode(UserInfo.self, from: data)
                    // 서버에서 전달받은 data를 매핑시켜줄 객체타입으로 CityCovideOverview를 설정
                    onCompleted(.success(result))
//                    // 응답이 완료되면. Completion Handler가 호출됨 -> result를 넘겨받아 data가 구조체로 매핑
                } catch { // 요청 O 응답 X
                    print("error")
                    onCompleted(.failure(error))

                    // 응답을 못받으면 error를 받음
                }
                
            case let .failure(error): // 요청 X
                onCompleted(.failure(error))
            }
        })
    }
}
