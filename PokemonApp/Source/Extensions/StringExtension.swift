//
//  StringExtension.swift
//  PokemonApp
//
//  Created by Gabriel Lopes Ferreira on 05/03/21.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
