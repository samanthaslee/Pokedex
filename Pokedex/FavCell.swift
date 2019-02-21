//
//  FavCell.swift
//  Pokedex
//
//  Created by Sam Lee on 2/13/19.
//  Copyright © 2019 Sam Lee. All rights reserved.
//

import UIKit

class FavCell: UITableViewCell {
    var favLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        favLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: contentView.frame.height))
        favLabel.center = CGPoint(x: 100, y: contentView.frame.height / 2)
        contentView.addSubview(favLabel)
    }
    
}
