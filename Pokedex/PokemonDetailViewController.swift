//
//  PokemonDetailViewController.swift
//  Pokedex
//
//  Created by Sam Lee on 2/10/19.
//  Copyright © 2019 Sam Lee. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController, UINavigationControllerDelegate{
    
    
    var pokeName : UILabel!
    var pokeNumberLabel : UILabel!
    var pokeAttackLabel : UILabel!
    var pokeDefenseLabel : UILabel!
    var pokeHealthLabel : UILabel!
    var pokeSpAttackLabel : UILabel!
    var pokeSpDefLabel : UILabel!
    var pokeSpeciesLabel : UILabel!
    var pokeSpeedLabel : UILabel!
    var pokeTotalLabel : UILabel!
    var pokeTypesLabel : UILabel!
    
    
    var pokeImage :  UIImage!
    
    var pokeImageView : UIImageView!
    
    var pokeNameText : String!
    
    var pokemonArrayFull = PokemonGenerator.getPokemonArray()
    
    var selectedPoke : Pokemon!
    
    var favButton : UIButton!
    
    var isOn = false
    
//    var favPokeList : [Pokemon] = []
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        self.dismiss(animated: true, completion: nil)
        if let vc = self.navigationController?.viewControllers[1] as? PokemonListViewController {
            if selectedPoke.favorite == true {
                vc.favoritedPokemon.append(selectedPoke)
            }
        }
    }
 
    
    override func viewWillAppear(_ animated: Bool) {
        if selectedPoke.favorite {
            favButton.setImage(UIImage(named: "fillstar"), for: .normal)
        } else {
            favButton.setImage(UIImage(named: "star"), for: .normal)
        }
        print(selectedPoke.favorite)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpDetailPage()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    
    
    @objc func setUpDetailPage() {
        favButton = UIButton(frame: CGRect(x: 300, y: 450, width: 25, height: 25))
        favButton.setImage(UIImage(named: "star"), for: .normal)
        favButton.contentMode = .scaleAspectFit
        favButton.addTarget(self, action: #selector(favClicked), for: .touchUpInside)
        view.addSubview(favButton)
        
        for pokemon in pokemonArrayFull {
            if pokemon.name.contains(pokeNameText) {
                selectedPoke = pokemon
                
            }
        }
        
        if selectedPoke.favorite {
            favButton.setImage(UIImage(named: "fillstar"), for: .normal)
        } else {
            favButton.setImage(UIImage(named: "star"), for: .normal)
        }
        
        pokeName = UILabel(frame: CGRect(x: 80, y: 130, width: 250, height: 50))
        pokeName.text = pokeNameText
        pokeName.adjustsFontSizeToFitWidth = true
        pokeName.textAlignment = NSTextAlignment.center
        view.addSubview(pokeName)
        
        pokeNumberLabel = UILabel(frame: CGRect(x: 80, y: 155, width: 250, height: 50))
        pokeNumberLabel.text = String(selectedPoke.number)
        pokeNumberLabel.adjustsFontSizeToFitWidth = true
        pokeNumberLabel.textAlignment = NSTextAlignment.center
        view.addSubview(pokeNumberLabel)
        
        pokeImageView = UIImageView(frame: CGRect(x: 55, y: 200, width: 275, height: 250))
        pokeImageView.image = pokeImage
        view.addSubview(pokeImageView)
        
        pokeAttackLabel = UILabel(frame: CGRect(x: 80, y: 460, width: 250, height: 50))
        pokeAttackLabel.text = "Attack: \(String(selectedPoke.attack))"
        pokeAttackLabel.adjustsFontSizeToFitWidth = true
        pokeAttackLabel.textAlignment = NSTextAlignment.center
        view.addSubview(pokeAttackLabel)
        
        pokeDefenseLabel = UILabel(frame: CGRect(x: 80, y: 490, width: 250, height: 50))
        pokeDefenseLabel.text = "Defense: \(String(selectedPoke.defense))"
        pokeDefenseLabel.adjustsFontSizeToFitWidth = true
        pokeDefenseLabel.textAlignment = NSTextAlignment.center
        view.addSubview(pokeDefenseLabel)
        
        pokeHealthLabel = UILabel(frame: CGRect(x: 80, y: 520, width: 250, height: 50))
        pokeHealthLabel.text = "Health: \(String(selectedPoke.health))"
        pokeHealthLabel.adjustsFontSizeToFitWidth = true
        pokeHealthLabel.textAlignment = NSTextAlignment.center
        view.addSubview(pokeHealthLabel)
        
        pokeSpAttackLabel = UILabel(frame: CGRect(x: 80, y: 550, width: 250, height: 50))
        pokeSpAttackLabel.text = "Special Attack: \(String(selectedPoke.specialAttack))"
        pokeSpAttackLabel.adjustsFontSizeToFitWidth = true
        pokeSpAttackLabel.textAlignment = NSTextAlignment.center
        view.addSubview(pokeSpAttackLabel)
        
        pokeSpDefLabel = UILabel(frame: CGRect(x: 80, y: 580, width: 250, height: 50))
        pokeSpDefLabel.text = "Special Defense: \(String(selectedPoke.specialDefense))"
        pokeSpDefLabel.adjustsFontSizeToFitWidth = true
        pokeSpDefLabel.textAlignment = NSTextAlignment.center
        view.addSubview(pokeSpDefLabel)
        
        pokeSpeciesLabel = UILabel(frame: CGRect(x: 80, y: 610, width: 250, height: 50))
        pokeSpeciesLabel.text = "Species: \(String(selectedPoke.species))"
        pokeSpeciesLabel.adjustsFontSizeToFitWidth = true
        pokeSpeciesLabel.textAlignment = NSTextAlignment.center
        view.addSubview(pokeSpeciesLabel)
        
        pokeSpeedLabel = UILabel(frame: CGRect(x: 80, y: 640, width: 250, height: 50))
        pokeSpeedLabel.text = "Speed: \(String(selectedPoke.speed))"
        pokeSpeedLabel.adjustsFontSizeToFitWidth = true
        pokeSpeedLabel.textAlignment = NSTextAlignment.center
        view.addSubview(pokeSpeedLabel)
        
        pokeTotalLabel = UILabel(frame: CGRect(x: 80, y: 670, width: 250, height: 50))
        pokeTotalLabel.text = "Total: \(String(selectedPoke.total))"
        pokeTotalLabel.adjustsFontSizeToFitWidth = true
        pokeTotalLabel.textAlignment = NSTextAlignment.center
        view.addSubview(pokeTotalLabel)
        
        pokeTypesLabel = UILabel(frame: CGRect(x: 80, y: 700, width: 250, height: 50))
        pokeTypesLabel.text = "Type: \(String(selectedPoke.total))"
        pokeTypesLabel.adjustsFontSizeToFitWidth = true
        pokeTypesLabel.textAlignment = NSTextAlignment.center
        view.addSubview(pokeTypesLabel)
        
    }
    
    @objc func favClicked() {
        activateButton(bool: !isOn)
    }
    
    @objc func activateButton(bool: Bool) {
        isOn = bool
        if isOn == true && selectedPoke.favorited == false {
            favButton.setImage(UIImage(named: "fillstar"), for: .normal)
            selectedPoke.favorite = true
            selectedPoke.favorited = true
            print(selectedPoke)
        } else {
            favButton.setImage(UIImage(named: "star"), for: .normal)
            selectedPoke.favorited = false
            selectedPoke.favorite = false

            
        }
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        <#code#>
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? PokemonListViewController {
            if selectedPoke.favorite == true {
                vc.favoritedPokemon.append(selectedPoke)
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

