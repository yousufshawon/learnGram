//
//  UnsplashService.swift
//  learnGram
//
//  Created by Yousuf on 5/6/23.
//

import Foundation
import Alamofire

class UnsplashService {
    
    private let baseUrl = "https://api.unsplash.com/"
    private let authorization = "Client-ID " + Keys.accessKey
    
    func getPhotos(callback : @escaping (SearchResponse) -> Void )  {
        
//        AF.request("https://api.unsplash.com/photos/?client_id=\(Keys.accessKey)").response { response in
//            debugPrint(response)
//        }
        
        let url = baseUrl + "search/photos/"
        let headers : HTTPHeaders = [
            "Authorization" : authorization
        ]
        var parameter : [String : String] = [:]
        parameter["query"] =  "Islam"
        
        AF.request(url, method: .get, parameters: parameter, encoder: URLEncodedFormParameterEncoder.default, headers: headers, interceptor: nil, requestModifier:
            nil).responseDecodable(of:SearchResponse.self) { response in
            
            print("Printing Response")
            debugPrint(response)
            
            switch (response.result) {
                
            case .success(_):
                print("Parse ok")
                let searchResponse = response.value ?? self.getEmptySearchResponse()
                callback(searchResponse)
                
            case let .failure(errorr):
                print(errorr)
                callback(self.getEmptySearchResponse())
            }
        }
    }
    
    private func getEmptySearchResponse() -> SearchResponse {
        return SearchResponse(total: 0, total_pages: 0, results: [])
    }
    
}
