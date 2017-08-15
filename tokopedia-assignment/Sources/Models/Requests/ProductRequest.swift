//
//  ProductRequest.swift
//  tokopedia-assignment
//
//  Created by Muhammad Ridho on 8/15/17.
//  Copyright © 2017 Ridho Pratama. All rights reserved.
//

import Foundation

struct ProductRequest {
    var query: String = "samsung"
    var priceMin: Int = 0
    var priceMax: Int = 0
    var isWholesale: Bool = true
    var isOfficial: Bool = true
    var fShop: Int = 2
    var start: Int = 0
    var rows: Int = 10
}
