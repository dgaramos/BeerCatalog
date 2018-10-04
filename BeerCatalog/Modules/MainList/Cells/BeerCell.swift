//
//  BeerCell.swift
//  BeerCatalog
//
//  Created by Danilo Ramos on 01/10/18.
//  Copyright © 2018 Danilo Ramos. All rights reserved.
//

import UIKit

class BeerCell: UITableViewCell {
    
    @IBOutlet weak var beerId: UILabel?
    @IBOutlet weak var beerName: UILabel?
    @IBOutlet weak var tagLine: UILabel?
    @IBOutlet weak var beerImage: UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
