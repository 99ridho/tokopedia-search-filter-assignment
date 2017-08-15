//
//  ProductViewModel.swift
//  tokopedia-assignment
//
//  Created by Muhammad Ridho on 8/15/17.
//  Copyright © 2017 Ridho Pratama. All rights reserved.
//

import Foundation
import RxSwift
import UIKit

struct ProductViewModel {
    
    var dummyData = Observable.of([
        (
            image: #imageLiteral(resourceName: "test-nokia-3310"),
            productName: "Nokia 3310 KW Super #1",
            price: "Rp. 20.000"
        ),
        (
            image: #imageLiteral(resourceName: "test-nokia-3310"),
            productName: "Nokia 3310 KW Super #1",
            price: "Rp. 20.000"
        ),
        (
            image: #imageLiteral(resourceName: "test-nokia-3310"),
            productName: "Nokia 3310 KW Super #1",
            price: "Rp. 20.000"
        ),
        (
            image: #imageLiteral(resourceName: "test-nokia-3310"),
            productName: "Nokia 3310 KW Super #1",
            price: "Rp. 20.000"
        ),
        (
            image: #imageLiteral(resourceName: "test-nokia-3310"),
            productName: "Nokia 3310 KW Super #1",
            price: "Rp. 20.000"
        ),
        (
            image: #imageLiteral(resourceName: "test-nokia-3310"),
            productName: "Nokia 3310 KW Super #1",
            price: "Rp. 20.000"
        ),
        (
            image: #imageLiteral(resourceName: "test-nokia-3310"),
            productName: "Nokia 3310 KW Super #1",
            price: "Rp. 20.000"
        ),
        (
            image: #imageLiteral(resourceName: "test-nokia-3310"),
            productName: "Nokia 3310 KW Super #1",
            price: "Rp. 20.000"
        ),
        (
            image: #imageLiteral(resourceName: "test-nokia-3310"),
            productName: "Nokia 3310 KW Super #1",
            price: "Rp. 20.000"
        ),
        (
            image: #imageLiteral(resourceName: "test-nokia-3310"),
            productName: "Nokia 3310 KW Super #1",
            price: "Rp. 20.000"
        )
    ])
    
    typealias ProductCollectionViewCellData = (imageUrl: String, productName: String, price: String)
    let productsObservable = BehaviorSubject<[ProductCollectionViewCellData]>(value: [])
    let productApiClient = ProductApiClient()
    let disposeBag = DisposeBag()
    
    private static var _instance: ProductViewModel? = nil
    static var sharedInstance: ProductViewModel {
        if _instance == nil {
            _instance = ProductViewModel()
        }
        
        return _instance!
    }
    
    private init() {
        refreshInitialProductsData()
    }
    
    func refreshInitialProductsData() {
        var req = ProductRequest()
        
        self.requestNewProductsData(req: req)
    }
    
    private func requestNewProductsData(req: ProductRequest) {
        productApiClient.getProducts(req: req)
            .subscribe(onNext: { res in 
                let formattedView = res.data.map {
                    return (
                        imageUrl: $0.imageUri700!,
                        productName: $0.name!,
                        price: $0.price!
                    )
                }
                
                self.productsObservable.onNext(formattedView)
            }, onError: { err in 
                self.productsObservable.onNext([])
            })
            .addDisposableTo(disposeBag)
    }
    
    func refreshProductsDataWithFilters(priceMin: Int = 0,
                                        priceMax: Int = 10000000,
                                        isWholesale: Bool = true,
                                        isOfficial: Bool = true,
                                        fShop: Int = 2,
                                        start: Int = 0,
                                        rows: Int = 10) {
     
        var req = ProductRequest()
        req.priceMin = priceMin
        req.priceMax = priceMax
        req.isWholesale = isWholesale
        req.isOfficial = isOfficial
        req.fShop = fShop
        req.start = start
        req.rows = rows
        
        self.requestNewProductsData(req: req)
    }
}
