//
//  PokemonListViewController.swift
//  Pokedex
//
//  Created by Sam Lee on 2/12/19.
//  Copyright © 2019 Sam Lee. All rights reserved.
//

import UIKit

class PokemonListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate {

    var ResultsCollectionView : UICollectionView!
    
    @IBOutlet var ResultsTableView: UITableView!
    @IBOutlet var FavTableView: UITableView!
    
    var pokemonArray = PokemonGenerator.getPokemonArray()
    var filteredPokemon : [Pokemon] = []
    var imageToPass : UIImage!
    var labelToPass: String!
    
    var pokemonTraitsList: [Any]!
    var favoritedPokemon : [Pokemon] = []
    
    var mainSearchbar: UISearchBar!
    var isTyping : Bool = false
    var isTypingList : [Pokemon] = []
    
    var layout = UICollectionViewFlowLayout()
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController!.isNavigationBarHidden = false
        setupResultsTableView()
        setupResultsCollectionView()
        setupFavTableView()
        //setUpSearchbar()
        ResultsCollectionView.isHidden = true
        FavTableView.isHidden = true
        ResultsTableView.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout.itemSize = CGSize(width: 100 , height: 100)
        
        setUpTableBar()
        
        filterPokemonTraits()
    
        setupResultsTableView()
        setupResultsCollectionView()
        setupFavTableView()
        setUpSearchbar()
        
        ResultsCollectionView.isHidden = true
        FavTableView.isHidden = true
        ResultsTableView.isHidden = false
        mainSearchbar.isHidden = false
        
        view.backgroundColor = .white
        
        print(pokemonTraitsList)
        print(favoritedPokemon)

        
    }
    
    func setUpTableBar() {
        let items = ["List View" , "Grid View", "Favorited"]
        var segmentedControl = UISegmentedControl(items : items)
        //segmentedControl = UISegmentedControl(frame: CGRect(x: 50, y: 100))
        segmentedControl.frame = CGRect(x: 85, y: 115, width: 250, height: 50)
        //segmentedControl.center = self.view.center
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(indexClicked(_:)), for: .valueChanged)
        
        segmentedControl.layer.cornerRadius = 5.0
        segmentedControl.backgroundColor = UIColor(red:0.22, green:0.38, blue:0.67, alpha:1.0)
        segmentedControl.tintColor = .white
        
        self.view.addSubview(segmentedControl)
    }
    
    func setUpSearchbar() {
        mainSearchbar = UISearchBar(frame: CGRect(x: 25, y: 175, width: view.frame.width - 50, height: 40))
        view.addSubview(mainSearchbar)
        mainSearchbar.placeholder = "Type Pokemon Name"
    }
    
    
    
    

    private func setUpTestLabel() {
    }
    
    @objc func indexClicked(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            print("List View");
            //resultsTableView
            ResultsCollectionView.isHidden = true
            ResultsTableView.isHidden = false
            FavTableView.isHidden = true
            mainSearchbar.isHidden = false

        case 1:
            print("Grid View")
            ResultsCollectionView.isHidden = false
            ResultsTableView.isHidden = true
            FavTableView.isHidden = true
            mainSearchbar.isHidden = true


        case 2:
            print("Favorite")
            ResultsTableView.isHidden = true
            ResultsCollectionView.isHidden = true
            FavTableView.isHidden = false
            mainSearchbar.isHidden = true

            for item in favoritedPokemon {
                print(item.name)
            }

        default:
            break
        }
    }
    
    //function that filters and compares each item in pokemonArray and pokemonTraitsList
    @objc func filterPokemonTraits() {
        for pokemon in pokemonArray {
            var fitsType = false
            print(pokemonTraitsList)
            for type in pokemonTraitsList[0] as! [String] {
                if pokemon.types.contains(type) {
                    fitsType = true
                    break
                }
            }
            if fitsType == false {
                continue
            }
            if pokemon.attack < pokemonTraitsList[1] as! Int {
                continue
            }
            if pokemon.defense < pokemonTraitsList[2] as! Int {
                continue
            }
            if pokemon.health < pokemonTraitsList[3] as! Int {
                continue
            }
            if fitsType == true {
                filteredPokemon.append(pokemon)
            }
        }
        print(filteredPokemon)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isTyping = true
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if mainSearchbar.text == nil || mainSearchbar.text == "" {
            isTyping = true
            isTypingList = filteredPokemon
            ResultsTableView.reloadData()
            print("istyping")
        } else {
            print("istyping")
            isTyping = false
            let predicateString = searchBar.text
            isTypingList = filteredPokemon.filter( {$0.name.range(of: predicateString!) != nil } )
            isTypingList.sort {$0.name < $1.name}
            
            
            //            for pokemon in filteredPokemon {
            //                if pokemon.name.contains(mainSearchbar.text as! Character) {
            //                    isTypingList = filteredPokemon.filt
            //                    ResultsTableView.reloadData()
            //                }
            //            }
        }
        ResultsTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? PokemonDetailViewController {
            vc.pokeImage = imageToPass
            vc.pokeNameText = labelToPass
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    

    
    

}
