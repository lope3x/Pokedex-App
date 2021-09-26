//
//  PokemonTypeView.swift
//  PokemonApp
//
//  Created by Gabriel Lopes Ferreira on 05/03/21.
//

import UIKit

class PokemonTypeView: CodedView {
    
    var type: PokemonType = .none {
        didSet {
            typeLabel.text = type.rawValue.capitalizingFirstLetter()
        }
    }
    
    var order: Order = .primary {
        didSet {
            switch order {
            case .primary:
                frame = CGRect(x: 0, y: 0, width: Metrics.LayoutSize.large, height: Metrics.LayoutSize.small)
            case .secondary:
                frame = CGRect(x: 0, y: 0, width: Metrics.LayoutSize.xLarge, height: Metrics.LayoutSize.small)
            }
            
        }
    }
    
    private let typeLabel: UILabel = {
        let label = UILabel()
        label.text = "Type"
        return label
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        backgroundColor = .lightGrayBackground
        self.layer.cornerRadius = Metrics.CornerRadius.base
        
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func addSubviews() {
        self.addSubview(typeLabel)
    }
    
    override func constrainSubviews() {
        typeLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        typeLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        typeLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        typeLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    
    
    
}
