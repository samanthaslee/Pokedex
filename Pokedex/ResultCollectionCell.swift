//
//  ResultCollectionCell.swift
//  Pokedex
//
//  Created by Sam Lee on 2/12/19.
//  Copyright © 2019 Sam Lee. All rights reserved.
//

import UIKit

class ResultCollectionCell: UICollectionViewCell {

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        resultCollectionPhoto = UIImageView(frame: CGRect(x: 30, y: 0, width: 55, height: 55))
        resultCollectionPhotoLabel = UILabel(frame: CGRect(x: 10, y: 57, width: 100, height: 25))
        resultCollectionNumber = UILabel(frame: CGRect(x: 10, y: 85, width: 100, height: 5))
        resultCollectionPhoto.contentMode = .scaleAspectFit
        resultCollectionPhotoLabel.textAlignment = .center
        resultCollectionNumber.textAlignment = .center
        resultCollectionPhotoLabel.font = resultCollectionPhotoLabel.font.withSize(10)
        resultCollectionNumber.font = resultCollectionNumber.font.withSize(7)
        resultCollectionPhotoLabel.backgroundColor = UIColor.clear
        resultCollectionPhotoLabel.numberOfLines = 0
        contentView.addSubview(resultCollectionPhoto)
        contentView.addSubview(resultCollectionNumber)
        contentView.addSubview(resultCollectionPhotoLabel)
        print(resultCollectionPhotoLabel)
    
    }
}
