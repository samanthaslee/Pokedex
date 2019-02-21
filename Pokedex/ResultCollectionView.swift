//
//  ResultCollectionView.swift
//  Pokedex
//
//  Created by Sam Lee on 2/14/19.
//  Copyright © 2019 Sam Lee. All rights reserved.
//

import UIKit

extension PokemonListViewController {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredPokemon.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = ResultsCollectionView.dequeueReusableCell(withReuseIdentifier: "ResultCollectionCell", for: indexPath) as! ResultCollectionCell
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        cell.awakeFromNib()
        let link = NSURL(string: filteredPokemon[indexPath.row].imageUrl)
        if link != nil {
            let url = NSData(contentsOf: link! as URL)
            if url != nil {
                cell.resultCollectionPhoto.image = UIImage(data: url! as Data)
            }
        } else {
            cell.resultCollectionPhoto.image = UIImage(named: "NoImageFound")
        }
        cell.resultCollectionPhoto.layoutIfNeeded()
        cell.resultCollectionPhotoLabel.text = filteredPokemon[indexPath.row].name
        cell.resultCollectionNumber.text = String(filteredPokemon[indexPath.row].number)
        cell.resultCollectionPhoto.translatesAutoresizingMaskIntoConstraints = true
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let link = NSURL(string: filteredPokemon[indexPath.row].imageUrl)
        if link != nil {
            let url = NSData(contentsOf: link! as URL)
            if url != nil {
                self.imageToPass = UIImage(data: url! as Data)
            }
        } else {
            self.imageToPass = UIImage(named: "NoImageFound")
        }
        self.labelToPass = filteredPokemon[indexPath.row].name
        performSegue(withIdentifier: "toDetails", sender: imageToPass)
    }
    
    func setupResultsCollectionView() {
        ResultsCollectionView = UICollectionView(frame: CGRect(x: 20, y: 200, width: view.frame.width - 50, height: view.frame.height - 300), collectionViewLayout: layout)
        ResultsCollectionView.register(ResultCollectionCell.self, forCellWithReuseIdentifier: "ResultCollectionCell")
        ResultsCollectionView.delegate = self
        ResultsCollectionView.dataSource = self
        ResultsCollectionView.isScrollEnabled = true
        ResultsCollectionView.backgroundColor = .white
        view.addSubview(ResultsCollectionView)
        
        
        
        
    }
    
    
}
