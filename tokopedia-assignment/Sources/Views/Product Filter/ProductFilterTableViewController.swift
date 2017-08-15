//
//  ProductFilterTableViewController.swift
//  tokopedia-assignment
//
//  Created by Muhammad Ridho on 8/15/17.
//  Copyright © 2017 Ridho Pratama. All rights reserved.
//

import UIKit
import SwiftRangeSlider
import RxSwift
import RxCocoa

class ProductFilterTableViewController: UITableViewController {
    
    @IBOutlet weak var priceRangeSlider: RangeSlider!
    @IBOutlet weak var isWholesaleSwitch: UISwitch!
    @IBOutlet weak var minPriceLabel: UILabel!
    @IBOutlet weak var maxPriceLabel: UILabel!
    
    let disposeBag = DisposeBag()
    var shopTypeFilter = (goldSelected: false, officialStore: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupSliderValueChangedEvent()
        setupSelectShopTypeFilter()
    }
    
    private func updatePriceRangeLabel() {
        self.minPriceLabel.text = "Rp. \(self.priceRangeSlider.lowerValue.formattedWithSeparator)"
        self.maxPriceLabel.text = "Rp. \(self.priceRangeSlider.upperValue.formattedWithSeparator)"
    }
    
    private func setupSliderValueChangedEvent() {
        self.updatePriceRangeLabel()
        priceRangeSlider
            .rx
            .controlEvent(UIControlEvents.valueChanged)
            .subscribe(onNext: { [unowned self] in
                self.updatePriceRangeLabel()
            })
            .addDisposableTo(disposeBag)
    }
    
    private func setupSelectShopTypeFilter() {
        self.tableView
            .rx
            .itemSelected
            .subscribe(onNext: { [unowned self] indexPath in 
                self.tableView.deselectRow(at: indexPath, animated: true)
                if indexPath.section == 1 {
                    let cell = self.tableView.cellForRow(at: indexPath)
                    if cell?.accessoryType == .checkmark {
                        cell?.accessoryType = .none
                    } else {
                        cell?.accessoryType = .checkmark
                    }
                    
                    if indexPath.row == 0 {
                        self.shopTypeFilter.goldSelected = !self.shopTypeFilter.goldSelected
                    } else if indexPath.row == 1 {
                        self.shopTypeFilter.officialStore = !self.shopTypeFilter.officialStore
                    }
                    
                    print(self.shopTypeFilter)
                }
            })
            .addDisposableTo(disposeBag)
    }

    @IBAction func productFilterButtonWhenTapped(_ sender: UIBarButtonItem) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
