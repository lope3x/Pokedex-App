//
//  PokemonsManager.swift
//  PokemonApp
//
//  Created by Gabriel Lopes Ferreira on 05/03/21.
//

import Foundation

class PokemonsManager {
    
    static let shared = PokemonsManager()
    
    
    let pokemonListService: PokemonListService = .shared
    
    static var pokemonOffset: Int = 0
    
    func getPokemonsList(completition: @escaping (Result<([PokemonListItem], Int), APIService.APIServiceError>) -> Void) {

        pokemonListService.getPokemonListData(offset: PokemonsManager.pokemonOffset){ result in
            switch result{
            case .success(let responseList):
                PokemonsManager.pokemonOffset+=20
                var pokemonList: [PokemonListItem] = []
                
                let group = DispatchGroup()
                
                responseList.results.forEach { pokemonListItemResponse in
                    group.enter()
                    let id =  Int(pokemonListItemResponse.url.split(separator: "/").last! ) ?? 1
                    self.pokemonListService.getPokemonListItemData(id: id) { result in
                        switch result {
                        case .success(let responseListItem):
                            let type = PokemonType(rawValue: responseListItem.types[0].type.name) ?? .none
                            var secondaryType: PokemonType?
                            if responseListItem.types.count > 1 {
                                secondaryType = PokemonType(rawValue: responseListItem.types[1].type.name) ?? PokemonType.none
                            }
                            let imageUrl = responseListItem.sprites.other.officialArtwork.frontDefault
                            let pokemonItem = PokemonListItem(primaryType: type,
                                                              secondaryType: secondaryType,
                                                              name: pokemonListItemResponse.name,
                                                              id: id,
                                                              image: imageUrl)
                            pokemonList.append(pokemonItem)
                            group.leave()
                            
                        case .failure(_):
                            group.leave()
                            completition(.failure(.apiError))
                        }
                    }
                }
                group.notify(queue: DispatchQueue.main) {
                    pokemonList.sort { $0.id < $1.id }
                    completition(.success((pokemonList,responseList.count)))
                }
            case .failure(_):
                completition(.failure(.apiError))
            }
        }
    }
}
