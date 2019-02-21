//
//  TypesController.swift
//  Pokedex
//
//  Created by Sam Lee on 2/10/19.
//  Copyright © 2019 Sam Lee. All rights reserved.
//

import UIKit

class TypesCell: UITableViewCell {
    var typeLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        typeLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: contentView.frame.height))
        typeLabel.center = CGPoint(x: 100, y: contentView.frame.height / 2)
        contentView.addSubview(typeLabel)
    }
    
}
