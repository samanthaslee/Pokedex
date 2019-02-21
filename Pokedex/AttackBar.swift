//
//  AttackBar.swift
//  Pokedex
//
//  Created by Sam Lee on 2/11/19.
//  Copyright © 2019 Sam Lee. All rights reserved.
//

import UIKit

extension StartViewController : UITextFieldDelegate {
    
    
    func setUpAttackText() {
        let attackTextField = UITextField(frame: CGRect(x: 80, y: 520, width: 250, height: 30))
        attackTextField.borderStyle = .roundedRect
        attackTextField.placeholder = "Enter minimum attack points!"
        attackTextField.keyboardAppearance = .dark
        attackTextField.keyboardType = .numberPad
        view.addSubview(attackTextField)
        
        
        
    }
    
    
}
