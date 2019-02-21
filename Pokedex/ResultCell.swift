//
//  ResultCell.swift
//  Pokedex
//
//  Created by Sam Lee on 2/12/19.
//  Copyright © 2019 Sam Lee. All rights reserved.
//

import UIKit

class ResultCell: UITableViewCell {
    var resultLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        resultLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: contentView.frame.height))
        resultLabel.center = CGPoint(x: 100, y: contentView.frame.height / 2)
        contentView.addSubview(resultLabel)
    }
    
}
