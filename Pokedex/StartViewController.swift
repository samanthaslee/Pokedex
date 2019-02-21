//
//  ViewController.swift
//  Pokedex
//
//  Created by Sam Lee on 2/10/19.
//  Copyright © 2019 Sam Lee. All rights reserved.
//

import UIKit

class StartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate{
    
    var pokemonLogoImageView : UIImageView!
    
    var introLabel : UILabel!
    var typeLabel : UILabel!
    var alreadyKnowLabel : UILabel!
    
    var attackTextField : UITextField!
    var defenseTextField : UITextField!
    var healthTextField : UITextField!
    
    var findPokemonButton : UIButton!
    var randomTwentyButton : UIButton!
    
    var pokemonTraits : [Any] = []
    var randomTraits : [Any] = []
    
    var copyoflist = PokemonGenerator.getPokemonArray()
    
    var typesList = ["Bug", "Grass", "Dark", "Ground", "Dragon", "Ice", "Electric", "Normal", "Fairy", "Poison", "Fighting", "Psychic", "Fire", "Rock", "Flying", "Steel", "Ghost", "Water"]
    
    var selectedTypesListString = [] as [String]


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController!.isNavigationBarHidden = true
        selectedTypesListString = []
        setupTableView()
        attackTextField.text = nil
        attackTextField.placeholder = "Enter min attack points!"
        defenseTextField.text = nil
        defenseTextField.placeholder = "Enter min defense points!"
        healthTextField.text = nil
        healthTextField.placeholder = "Enter min health points!"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startSetUp()
    }
    
    @objc func startSetUp() {
        //pokemon logo
        pokemonLogoImageView = UIImageView(frame: CGRect(x: 10, y: 75, width: view.frame.width - 25, height: 200))
        pokemonLogoImageView.contentMode = .scaleAspectFit
        pokemonLogoImageView.image = UIImage(named: "pokemonlogo")
        view.addSubview(pokemonLogoImageView)
        
        
        //intro label
        typeLabel = UILabel(frame: CGRect(x: 0, y: 260, width: view.frame.width, height: 50))
        typeLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        typeLabel.textColor = .black
        typeLabel.textAlignment = NSTextAlignment.center
        typeLabel.text = "Which type of Pokemon are you looking for?"
        view.addSubview(typeLabel)
        
        //select type label
        typeLabel = UILabel(frame: CGRect(x: 115, y: 320, width: view.frame.height / 6, height: 50))
        typeLabel.backgroundColor = .white
        typeLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        typeLabel.textColor = UIColor(red:0.22, green:0.38, blue:0.67, alpha:1.0)
        typeLabel.textAlignment = NSTextAlignment.center
        typeLabel.text = "Select Type:"
        view.addSubview(typeLabel)
        
        
        //setting up table func
        setupTableView()
        
        
        //attack text box
        attackTextField = UITextField(frame: CGRect(x: 80, y: 500, width: 250, height: 30))
        attackTextField.borderStyle = .roundedRect
        attackTextField.placeholder = "Enter min attack points!"
        attackTextField.keyboardAppearance = .dark
        attackTextField.keyboardType = .numberPad
        attackTextField.delegate = self
        view.addSubview(attackTextField)
        
        
        
        //defense points
        defenseTextField = UITextField(frame: CGRect(x: 80, y: 540, width: 250, height: 30))
        defenseTextField.borderStyle = .roundedRect
        defenseTextField.placeholder = "Enter min defense points!"
        defenseTextField.keyboardAppearance = .dark
        defenseTextField.keyboardType = .numberPad
        defenseTextField.delegate = self
        view.addSubview(defenseTextField)
        
        //health points
        healthTextField = UITextField(frame: CGRect(x: 80, y: 580, width: 250, height: 30))
        healthTextField.borderStyle = .roundedRect
        healthTextField.placeholder = "Enter min health points!"
        healthTextField.keyboardAppearance = .dark
        healthTextField.keyboardType = .numberPad
        healthTextField.delegate = self
        view.addSubview(healthTextField)
        
        //find pokemon
        findPokemonButton = UIButton(frame: CGRect(x: 80, y: 620, width: 250, height: 50))
        findPokemonButton.setTitle("Find Pokemon!", for: .normal)
        findPokemonButton.setTitleColor(UIColor(red:0.22, green:0.38, blue:0.67, alpha:1.0), for: .normal)
        findPokemonButton.backgroundColor = UIColor(red:1.00, green:0.80, blue:0.03, alpha:1.0)
        findPokemonButton.layer.cornerRadius = 20
        findPokemonButton.layer.borderWidth = 5
        findPokemonButton.layer.borderColor = UIColor(red:0.22, green:0.38, blue:0.67, alpha:1.0).cgColor
        findPokemonButton.addTarget(self, action: #selector(findPokemonClicked), for: .touchUpInside)
        findPokemonButton.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        findPokemonButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        //make button add it to pokemonTraits array
        view.addSubview(findPokemonButton)
        
        //already know label
        alreadyKnowLabel = UILabel(frame: CGRect(x: 0, y: 690, width: view.frame.width, height: 50))
        alreadyKnowLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        alreadyKnowLabel.textColor = .black
        alreadyKnowLabel.textAlignment = NSTextAlignment.center
        alreadyKnowLabel.text = "Feeling bored?"
        view.addSubview(alreadyKnowLabel)
        
        //already know text field
        findPokemonButton = UIButton(frame: CGRect(x: 80, y: 620, width: 250, height: 50))
        findPokemonButton.setTitle("Find Pokemon!", for: .normal)
        findPokemonButton.setTitleColor(UIColor(red:0.22, green:0.38, blue:0.67, alpha:1.0), for: .normal)
        findPokemonButton.backgroundColor = UIColor(red:1.00, green:0.80, blue:0.03, alpha:1.0)
        findPokemonButton.layer.cornerRadius = 20
        findPokemonButton.layer.borderWidth = 5
        findPokemonButton.layer.borderColor = UIColor(red:0.22, green:0.38, blue:0.67, alpha:1.0).cgColor
        findPokemonButton.addTarget(self, action: #selector(findPokemonClicked), for: .touchUpInside)
        findPokemonButton.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        findPokemonButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        //make button add it to pokemonTraits array
        view.addSubview(findPokemonButton)
        
        
        randomTwentyButton = UIButton(frame: CGRect(x: 80, y: 735, width: 250, height: 50))
        randomTwentyButton.isHidden = false
        randomTwentyButton.setTitle("20 Random Pokemon", for: .normal)
        randomTwentyButton.setTitleColor(UIColor(red:1.00, green:0.80, blue:0.03, alpha:1.0), for: .normal)
        randomTwentyButton.backgroundColor = UIColor(red:0.22, green:0.38, blue:0.67, alpha:1.0)
        randomTwentyButton.layer.cornerRadius = 20
        randomTwentyButton.layer.borderWidth = 5
        randomTwentyButton.addTarget(self, action: #selector(findRandomClicked), for: .touchUpInside)
        randomTwentyButton.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        randomTwentyButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        randomTwentyButton.layer.borderColor = UIColor(red:0.22, green:0.38, blue:0.67, alpha:1.0).cgColor
        view.addSubview(randomTwentyButton)
        
    }
    
        // Do any additional setup after loading the view, typically from a nib.
    
    @objc func findRandomClicked() {
//        var randomList = [Pokemon]()
//        while randomList.count < 20 {
//            var randomName = copyoflist.randomElement()!
//            randomList.append(randomName)
//        }
//        print(randomList)
        
        pokemonTraits = [[typesList], 20, 30, 50]
//        if selectedTypesListString == [] {
//            pokemonTraits.append(typesList)
//        } else {
//            pokemonTraits.append(selectedTypesListString)
//        }
//        if attackTextField.text == ""{
//            pokemonTraits.append(10)
//        } else {
//            pokemonTraits.append(Int(attackTextField.text!)!)
//        }
//        if defenseTextField.text == ""{
//            pokemonTraits.append(20)
//        } else {
//            pokemonTraits.append(Int(defenseTextField.text!)!)
//        }
//        if healthTextField.text == ""{
//            pokemonTraits.append()
//        } else {
//            pokemonTraits.append(Int(healthTextField.text!)!)
//        }
//
//        pokemonTraits = [[typesList]]
//
//        let lower : UInt32 = 0
//        let upper : UInt32 = 80
//        let randomNumber = arc4random_uniform(upper - lower) + lower
//
//        while pokemonTraits.count < 3 {
//            pokemonTraits.append(Int(randomNumber))
//        }
        
        performSegue(withIdentifier: "toPokemonList", sender: self)
        
    }
    
    @objc func findPokemonClicked() {
        if selectedTypesListString == [] {
            pokemonTraits.append(typesList)
        } else {
            pokemonTraits.append(selectedTypesListString)
        }
        if attackTextField.text == ""{
            pokemonTraits.append(0)
        } else {
            pokemonTraits.append(Int(attackTextField.text!)!)
        }
        if defenseTextField.text == ""{
            pokemonTraits.append(0)
        } else {
            pokemonTraits.append(Int(defenseTextField.text!)!)
        }
        if healthTextField.text == ""{
            pokemonTraits.append(0)
        } else {
            pokemonTraits.append(Int(healthTextField.text!)!)
        }
        print(pokemonTraits)
        performSegue(withIdentifier: "toPokemonList", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? PokemonListViewController {
            vc.pokemonTraitsList = pokemonTraits

            
        }
    }
    

}

