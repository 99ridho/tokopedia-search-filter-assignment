//
//  ProductFilterSharedData.swift
//  tokopedia-assignment
//
//  Created by Muhammad Ridho on 8/15/17.
//  Copyright © 2017 Ridho Pratama. All rights reserved.
//

import Foundation

struct ProductFilterSharedData {
    static var priceMin: Double = 0.0
    static var priceMax: Double = 10000000.0
    static var isWholesale: Bool = true
    static var isOfficial: Bool = true
    static var fShop: Int = 2
    
    static func resetToInitialValues() {
        priceMin = 0
        priceMax = 10000000
        isWholesale = true
        isOfficial = true
        fShop = 2
    }
}
