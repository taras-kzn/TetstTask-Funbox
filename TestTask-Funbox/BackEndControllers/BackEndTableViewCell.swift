//
//  BackEndTableViewCell.swift
//  TestTask-Funbox
//
//  Created by admin on 29.07.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class BackEndTableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var countLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
}

extension BackEndTableViewCell {
    static var reuseId: String {
        return String(describing: self)
    }
}
