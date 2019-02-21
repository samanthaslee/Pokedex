//
//  TypeTableView - setup.swift
//  Pokedex
//
//  Created by Sam Lee on 2/14/19.
//  Copyright © 2019 Sam Lee. All rights reserved.
//

import UIKit

extension StartViewController {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return typesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Types", for: indexPath)
            as! TypesCell
        
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        
        cell.awakeFromNib()
        cell.typeLabel.text = typesList[indexPath.row]
        cell.isSelected = false
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedTypesListString.append(typesList[indexPath.row])
        print(selectedTypesListString)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let index = selectedTypesListString.index(of: selectedTypesListString[indexPath.row]) {
            selectedTypesListString.remove(at: index)
        }
        //selectedTypesListString.remove(at: selectedTypesListString[indexPath.row].index)
        print(selectedTypesListString)
    }
    
    func setupTableView() {
        
        var typesTableView = UITableView(frame: CGRect(x: 115, y: 360, width: view.frame.height / 6, height: view.frame.height / 7))
        typesTableView.register(TypesCell.self, forCellReuseIdentifier: "Types")
        typesTableView.delegate = self
        typesTableView.dataSource = self
        typesTableView.allowsMultipleSelection = true
        
        view.addSubview(typesTableView)
        
    }
}
