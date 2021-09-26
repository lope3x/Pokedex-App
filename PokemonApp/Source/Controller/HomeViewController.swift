//
//  HomeViewController.swift
//  PokemonApp
//
//  Created by Gabriel Lopes Ferreira on 04/03/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let pokemonsManager: PokemonsManager = .shared
    
    private var homeView: HomeView {
        guard let view = self.view as? HomeView else {
            preconditionFailure()
        }
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getMorePokemons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        let navigationBar = self.navigationController?.navigationBar
        navigationBar?.setBackgroundImage(UIImage(), for: .default)
        navigationBar?.shadowImage = UIImage()
        navigationBar?.isTranslucent = true
    }
    
    override func loadView() {
        let view = HomeView {
            self.getMorePokemons()
        }
        self.view = view
    }
    
    private func getMorePokemons() {
        pokemonsManager.getPokemonsList { result in
            switch result{
            case .success(let (pokemonList, totalPokemonCount)):
                self.homeView.pokemonList.append(contentsOf: pokemonList)
                self.homeView.totalPokemonCount = totalPokemonCount
            case .failure(let error):
                print(error)
            }
        }
    }
}

