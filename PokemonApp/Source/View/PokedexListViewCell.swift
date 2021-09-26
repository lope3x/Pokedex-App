//
//  PokedexListViewCell.swift
//  PokemonApp
//
//  Created by Gabriel Lopes Ferreira on 04/03/21.
//

import UIKit


class PokedexListViewCell: CodedCollectionViewCell {
    
    static let identifier = String(describing: PokedexListViewCell.self)
    
    var pokemon: PokemonListItem? = nil {
        didSet {
            didSetPokemon()
        }
    }
    
    private let pokeballImage: UIImageView = {
        let image = UIImage(named: "pokeball_solid")
        let view = UIImageView(image: image)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.image = view.image?.withRenderingMode(.alwaysTemplate)
        view.tintColor = .lightGrayBackground
        return view
    }()
    
    private lazy var pokemonImage: UIImageView = {
        let image = UIImage()
        let view = UIImageView(image: image)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private lazy var idLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    private lazy var pokemonNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var pokemonPrimaryTypeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var pokemonSecondaryTypeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center

        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGrayBackground
        self.layer.cornerRadius = Metrics.CornerRadius.base
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        pokemon = nil
        pokemonImage.image = nil
        pokemonPrimaryTypeLabel.attributedText = nil
        pokemonSecondaryTypeLabel.attributedText = nil
        pokemonSecondaryTypeLabel.isHidden = true
    }
    
    override func addSubviews() {
        addSubview(pokemonImage)
        addSubview(pokeballImage)
        addSubview(idLabel)
        addSubview(pokemonNameLabel)
        addSubview(pokemonPrimaryTypeLabel)
        addSubview(pokemonSecondaryTypeLabel)
    }
    
    override func constrainSubviews() {
        constrainPokemonImage()
        constrainPokeBallImage()
        constrainIdLabel()
        constrainPokemonNameLabel()
        constrainPokemonTypesLabel()
    }
    
    private func constrainPokemonImage() {
        pokemonImage.rightAnchor.constraint(equalTo: rightAnchor, constant: .zero).isActive = true
        pokemonImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: .zero).isActive = true
        pokemonImage.widthAnchor.constraint(equalToConstant: self.frame.width*0.5).isActive = true
        pokemonImage.heightAnchor.constraint(equalToConstant: self.frame.height*0.75).isActive = true
        bringSubviewToFront(pokemonImage)
    }
    
    private func constrainPokeBallImage() {
        pokeballImage.heightAnchor.constraint(equalToConstant: Metrics.LayoutSize.gigant).isActive = true
        pokeballImage.widthAnchor.constraint(equalToConstant: Metrics.LayoutSize.gigant).isActive = true
        pokeballImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Metrics.Spacing.small).isActive = true
        pokeballImage.rightAnchor.constraint(equalTo: rightAnchor, constant: Metrics.Spacing.xxxSmall).isActive = true
    }
    
    private func constrainIdLabel() {
        idLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -Metrics.Spacing.small).isActive = true
        idLabel.topAnchor.constraint(equalTo: topAnchor, constant: Metrics.Spacing.xSmall).isActive = true
    }
    
    private func constrainPokemonNameLabel() {
        pokemonNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: Metrics.Spacing.medium).isActive = true
        pokemonNameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: Metrics.Spacing.xSmall).isActive = true
    }
    
    private func constrainPokemonTypesLabel() {
        pokemonPrimaryTypeLabel.topAnchor.constraint(equalTo: pokemonNameLabel.bottomAnchor, constant: Metrics.Spacing.xSmall).isActive = true
        pokemonPrimaryTypeLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: Metrics.Spacing.xSmall).isActive = true
        pokemonPrimaryTypeLabel.widthAnchor.constraint(equalToConstant: Metrics.LayoutSize.large).isActive = true
        pokemonPrimaryTypeLabel.heightAnchor.constraint(equalToConstant: Metrics.LayoutSize.small).isActive = true

        pokemonSecondaryTypeLabel.topAnchor.constraint(equalTo: pokemonPrimaryTypeLabel.bottomAnchor, constant: Metrics.Spacing.xxxSmall).isActive = true
        pokemonSecondaryTypeLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: Metrics.Spacing.xSmall).isActive = true
        pokemonSecondaryTypeLabel.widthAnchor.constraint(equalToConstant: Metrics.LayoutSize.xLarge).isActive = true
        pokemonSecondaryTypeLabel.heightAnchor.constraint(equalToConstant: Metrics.LayoutSize.small).isActive = true
    }
    
    private func didSetPokemon() {
        guard let pokemon = pokemon, let url = URL(string: pokemon.image) else { return }
        guard let fontBold = UIFont(name: "CircularStd-Bold", size: Metrics.FontSize.body.value) else { preconditionFailure("Error font") }
        guard let fontBook = UIFont(name: "CircularStd-Book", size: Metrics.FontSize.itemLabel.value) else { preconditionFailure("Error font") }

        
        let messageId = NSMutableAttributedString(
            string:  "#\(String(format: "%03d", pokemon.id))",
            attributes: [.font: fontBold,
                         .foregroundColor: UIColor.black])
        let messageName = NSMutableAttributedString(
            string:  pokemon.name.capitalizingFirstLetter(),
            attributes: [.font: fontBold,
                         .foregroundColor: UIColor.white])
        
        pokemonImage.load(url: url)
        idLabel.attributedText = messageId
        pokemonNameLabel.attributedText = messageName
        backgroundColor = pokemon.primaryType.color(for: .primary)
        pokeballImage.tintColor = pokemon.primaryType.color(for: .secondary)
        
        
        //Type Labels
        
        let primaryTypeMessage = NSMutableAttributedString(
            string:   pokemon.primaryType.rawValue.capitalizingFirstLetter(),
            attributes: [.font: fontBook,
                         .foregroundColor: UIColor.lightGrayBackground])
        pokemonPrimaryTypeLabel.attributedText = primaryTypeMessage
        pokemonPrimaryTypeLabel.backgroundColor = pokemon.primaryType.color(for: .secondary)
        pokemonPrimaryTypeLabel.layer.cornerRadius = Metrics.CornerRadius.tiny
        pokemonPrimaryTypeLabel.layer.masksToBounds = true
        
        
        guard let secondaryType = pokemon.secondaryType else { return }
        
        let secondaryTypeMessage = NSMutableAttributedString(
            string:   secondaryType.rawValue.capitalizingFirstLetter(),
            attributes: [.font: fontBook,
                         .foregroundColor: UIColor.lightGrayBackground])
        pokemonSecondaryTypeLabel.isHidden = false
        pokemonSecondaryTypeLabel.attributedText = secondaryTypeMessage
        pokemonSecondaryTypeLabel.backgroundColor = pokemon.primaryType.color(for: .secondary)
        pokemonSecondaryTypeLabel.layer.cornerRadius = Metrics.CornerRadius.tiny
        pokemonSecondaryTypeLabel.layer.masksToBounds = true
    }
}
