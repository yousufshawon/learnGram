//
//  NetworkModel.swift
//  learnGram
//
//  Created by Yousuf on 8/6/23.
//

import Foundation


struct PhotoResponse : Decodable {
    
    var items : [PhotoItemResponse] = []
}

struct SearchResponse : Decodable {
    var total : Int
    var total_pages : Int
    var results : [PhotoItemResponse]
    
}

struct PhotoItemResponse : Decodable {
    var description : String?
    var alt_description : String?
    var urls : UrlResponse

}

struct UrlResponse : Decodable {
    var small : String
}
