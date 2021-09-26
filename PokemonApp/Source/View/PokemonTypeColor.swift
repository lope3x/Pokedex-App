//
//  PokemonTypeColor.swift
//  PokemonApp
//
//  Created by Gabriel Lopes Ferreira on 05/03/21.
//

import UIKit

extension PokemonType {
    enum Order {
        case primary
        case secondary
        case terciary
    }
    
    func color(for order: Order) -> UIColor {
        switch self {
        case .fire:
            switch order {
            case .primary:
                return .firePrimary
            case .secondary:
                return .fireSecondary
            case .terciary:
                return .fireTerciary
            }
        case .grass:
            switch order {
            case .primary:
                return .grassPrimary
            case .secondary:
                return .grassSecondary
            case .terciary:
                return .grassTerciary
            }
        case .water:
            switch order {
            case .primary:
                return .waterPrimary
            case .secondary:
                return .waterSecondary
            case .terciary:
                return .waterTerciary
            }
        default:
            switch order {
            case .primary:
                return .lightGrayBackground
            case .secondary:
                return .warmGrey
            case .terciary:
                return .black
            }
        }
    }
}
