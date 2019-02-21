//
//  ResultTableView.swift
//  Pokedex
//
//  Created by Sam Lee on 2/14/19.
//  Copyright © 2019 Sam Lee. All rights reserved.
//

import UIKit

extension PokemonListViewController {
    //table view number of rows in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == ResultsTableView {
            if isTyping {
                return isTypingList.count
            } else {
               return filteredPokemon.count
            }
        } else {
            return favoritedPokemon.count
        }
    }
    
    //table view cell for row at section
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == ResultsTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Result", for: indexPath)
                as! ResultCell
            for subview in cell.contentView.subviews {
                subview.removeFromSuperview()
            }
            
            cell.awakeFromNib()
            
            if isTyping {
                cell.resultLabel.text = isTypingList[indexPath.row].name
            } else {
                cell.resultLabel.text = filteredPokemon[indexPath.row].name
            }
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Fav", for: indexPath)
                as! FavCell
            for subview in cell.contentView.subviews {
                subview.removeFromSuperview()
            }
            
            cell.awakeFromNib()
            cell.favLabel.text = favoritedPokemon[indexPath.row].name
            cell.favLabel.textColor = .black
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == ResultsTableView {
            let link = NSURL(string: filteredPokemon[indexPath.row].imageUrl)
            if link != nil {
                let url = NSData(contentsOf: link! as URL)
                if url != nil {
                    self.imageToPass = UIImage(data: url! as Data)
                }
            }
            self.labelToPass = filteredPokemon[indexPath.row].name
            performSegue(withIdentifier: "toDetails", sender: self)
        } else {
            let link = NSURL(string: favoritedPokemon[indexPath.row].imageUrl)
            if link != nil {
                let url = NSData(contentsOf: link! as URL)
                if url != nil {
                    self.imageToPass = UIImage(data: url! as Data)
                }
            }
            self.labelToPass = favoritedPokemon[indexPath.row].name
            performSegue(withIdentifier: "toDetails", sender: self)
        }

    }
    
    func setupResultsTableView() {
        
        ResultsTableView = UITableView(frame: CGRect(x: 25, y: 220, width: view.frame.width - 50, height: view.frame.height - 300))
        ResultsTableView.register(ResultCell.self, forCellReuseIdentifier: "Result")
        ResultsTableView.delegate = self
        ResultsTableView.dataSource = self
        ResultsTableView.allowsMultipleSelection = false
        view.addSubview(ResultsTableView)
        
    }
    
    func setupFavTableView() {
        
        FavTableView = UITableView(frame: CGRect(x: 25, y: 200, width: view.frame.width - 50, height: view.frame.height - 300))
        FavTableView.register(FavCell.self, forCellReuseIdentifier: "Fav")
        FavTableView.delegate = self
        FavTableView.dataSource = self
        FavTableView.allowsMultipleSelection = false
        view.addSubview(FavTableView)
        
    }
}
