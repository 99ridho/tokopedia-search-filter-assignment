//
//  ProductResponse.swift
//  tokopedia-assignment
//
//  Created by Muhammad Ridho on 8/15/17.
//  Copyright © 2017 Ridho Pratama. All rights reserved.
//

import Foundation
import ObjectMapper

class ProductResponse: Mappable {
    var status: Status!
    var data: [ProductData]! = []
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        data <- map["data"]
    }
 
    // sub product object class
    class Status: Mappable {
        var errorCode: Int!
        var message: String!
        
        required init?(map: Map) {
            
        }
        
        func mapping(map: Map) {
            errorCode <- map["error_code"]
            message <- map["message"]
        }
    }
    
    class ProductData: Mappable {
        var id: Int!
        var name: String!
        var uri: String!
        var imageUri700: String!
        var price: String!
        
        required init?(map: Map) {
            
        }
        
        func mapping(map: Map) {
            id <- map["id"]
            name <- map["name"]
            uri <- map["uri"]
            imageUri700 <- map["image_uri_700"]
            price <- map["price"]
        }
    }
    
}
