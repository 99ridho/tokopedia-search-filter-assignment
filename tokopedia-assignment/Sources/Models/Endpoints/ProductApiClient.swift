//
//  ProductApiClient.swift
//  tokopedia-assignment
//
//  Created by Muhammad Ridho on 8/15/17.
//  Copyright © 2017 Ridho Pratama. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import Moya_ObjectMapper

struct ProductApiClient {
    
    private let provider = RxMoyaProvider<ProductApi>()
    
    // request products data, and return response as observable
    func getProducts(req: ProductRequest) -> Observable<ProductResponse> {
        return provider
            .request(.getProduct(request: req))
            .mapObject(ProductResponse.self)
            .retry(3)
    }
    
}
