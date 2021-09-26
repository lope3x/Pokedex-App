//
//  HomeView.swift
//  PokemonApp
//
//  Created by Gabriel Lopes Ferreira on 04/03/21.
//

import UIKit


class HomeView: CodedView {
    
    private var getMorePokemons: () -> Void
    
    var pokemonList: [PokemonListItem] = [] {
        didSet{
            DispatchQueue.main.async {
                self.pokedexCollectionView.reloadData()
            }
        }
    }
    
    var totalPokemonCount: Int = 0 
    
    private let pokeballImage: UIImageView = {
        let image = UIImage(named: "pokeball")
        let view = UIImageView(image: image)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private let pokedexLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        guard let font = UIFont(name: "CircularStd-Black", size: Metrics.FontSize.headline.value) else { preconditionFailure("Error font") }
        
        let message = NSMutableAttributedString(
            string: "Pokedex",
            attributes: [.font: font,
                         .foregroundColor: UIColor.black])
        
        label.attributedText = message
        return label
    }()
    
    private lazy var pokedexCollectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = Metrics.Spacing.xSmall
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = .white
        collection.register(PokedexListViewCell.self, forCellWithReuseIdentifier: PokedexListViewCell.identifier)
//        collection.bounces = false
        return collection
    }()
    

    init(getMorePokemons: @escaping () -> Void) {
        self.getMorePokemons = getMorePokemons
        super.init(frame: .zero)
        self.backgroundColor = .white
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func addSubviews() {
        self.addSubview(pokeballImage)
        self.addSubview(pokedexLabel)
        self.addSubview(pokedexCollectionView)
    }
    
    override func constrainSubviews() {
        constrainPokeballImage()
        constrainPokedexLabel()
        constrainPokedexCollectionView()
    }
    
    private func constrainPokeballImage() {
        pokeballImage.topAnchor.constraint(equalTo: topAnchor, constant: -Metrics.Spacing.large).isActive = true
        pokeballImage.rightAnchor.constraint(equalTo: rightAnchor, constant: Metrics.Spacing.xLarge).isActive = true
    }
    
    private func constrainPokedexLabel() {
        pokedexLabel.topAnchor.constraint(equalTo: pokeballImage.bottomAnchor, constant: -Metrics.Spacing.xLarge).isActive = true
        pokedexLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: Metrics.Spacing.base).isActive = true
    }
    
    private func constrainPokedexCollectionView() {
        pokedexCollectionView.topAnchor.constraint(equalTo: pokedexLabel.bottomAnchor, constant: Metrics.Spacing.base).isActive = true
        pokedexCollectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: Metrics.Spacing.base).isActive = true
        pokedexCollectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: -Metrics.Spacing.base).isActive = true
        pokedexCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

extension HomeView: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath)
        -> CGSize {
            .init(
                width: pokedexCollectionView.frame.width*0.5 - Metrics.Spacing.xxxSmall,
                height: pokedexCollectionView.frame.height * 0.25)
    }
    
    
}

extension HomeView: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        totalPokemonCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell =
                collectionView
                .dequeueReusableCell(withReuseIdentifier: PokedexListViewCell.identifier, for: indexPath) as? PokedexListViewCell
                else { preconditionFailure() }
        if pokemonList.count-1 >= indexPath.row {
            let pokemon = pokemonList[indexPath.row]
            cell.pokemon = pokemon
        }
        cell.clipsToBounds = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let index = indexPath.row
        
        if index == pokemonList.count {
            self.getMorePokemons()
        }
    }
    
}
