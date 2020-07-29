//
//  StoreFrontCollectionViewCell.swift
//  TestTask-Funbox
//
//  Created by admin on 20.07.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class StoreFrontCollectionViewCell: UICollectionViewCell {
//MARK: - IBOutlets
    @IBOutlet var buyLabel: UIButton!
    @IBOutlet var nameModelLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var countLabel: UILabel!
//MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        buyLabel.layer.cornerRadius = 20
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameModelLabel.text = nil
        priceLabel.text = nil
        countLabel.text = nil
    }

}

extension StoreFrontCollectionViewCell {
    static var reuseId: String {
        return String(describing: self)
    }
}
