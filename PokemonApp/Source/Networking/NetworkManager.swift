//
//  NetworkManager.swift
//  PokemonApp
//
//  Created by Gabriel Lopes Ferreira on 05/03/21.
//

import Foundation

protocol NetworkManagerProtocol {
    func getPokemonsList()
}

class NetworkManager {
    
    //MARK - Singleton
    static let shared = NetworkManager()
    
    private let urlSession = URLSession.shared

}
