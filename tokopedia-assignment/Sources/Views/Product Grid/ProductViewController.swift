//
//  ProductViewController.swift
//  tokopedia-assignment
//
//  Created by Muhammad Ridho on 8/15/17.
//  Copyright © 2017 Ridho Pratama. All rights reserved.
//

import UIKit
import Moya
import RxSwift
import RxCocoa
import Moya_ObjectMapper
import SDWebImage

class ProductViewController: UIViewController {

    @IBOutlet weak var productCollectionView: UICollectionView!
    
    let viewModel = ProductViewModel()
    let disposeBag = DisposeBag()
    
    let productCollViewReusableId = "product_cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        self.viewModel.refreshInitialProductsData()
        self.viewModel.productsObservable.bind(to: self.productCollectionView.rx.items) { [unowned self] cv, row, el in
            let indexPath = IndexPath(row: row, section: 0)
            let cell = cv.dequeueReusableCell(withReuseIdentifier: self.productCollViewReusableId, for: indexPath) as! ProductCollectionViewCell
            
            cell.productImageView.sd_setImage(with: URL(string: el.imageUrl), placeholderImage: #imageLiteral(resourceName: "img-placeholder"))
            cell.productNameLabel.text = el.productName
            cell.productPriceLabel.text = el.price
            
            return cell
        }
        .addDisposableTo(disposeBag)
        
        self.productCollectionView.rx.setDelegate(self).addDisposableTo(disposeBag)
    }

}

extension ProductViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = UIScreen.main.bounds.size.width
        
        return CGSize(width: (width / 2) - 1, height: 200.0)
    }
}
