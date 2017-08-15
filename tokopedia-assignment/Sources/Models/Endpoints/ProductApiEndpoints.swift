//
//  ProductApiEndpoints.swift
//  tokopedia-assignment
//
//  Created by Muhammad Ridho on 8/15/17.
//  Copyright © 2017 Ridho Pratama. All rights reserved.
//

import Foundation
import Moya

enum ProductApi {
    case getProduct(request: ProductRequest)
}

extension ProductApi: TargetType {
    
    var baseURL: URL { return URL(string: "https://ace.tokopedia.com/search/v2.5")! }
    
    var path: String {
        switch self {
        case .getProduct(_):
            return "/product"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getProduct(_):
            return .get
        }
    }
    
    var parameters: [String:Any]? {
        switch self {
        case .getProduct(let request):
            return [
                "q": request.query,
                "pmin": request.priceMin,
                "pmax": request.priceMax,
                "wholesale": request.isWholesale,
                "official": request.isOfficial,
                "fshop": request.fShop,
                "start": request.start,
                "rows": request.rows
            ]
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .getProduct(_):
            return URLEncoding.default
        }
    }
    
    var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }
    
    var task: Task {
        return .request
    }
}
