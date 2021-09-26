//
//  PokemonListService.swift
//  PokemonApp
//
//  Created by Gabriel Lopes Ferreira on 05/03/21.
//

import Foundation

class PokemonListService: APIService {
    
    public static let shared = PokemonListService()
    
    private override init() {}
        
    enum Endpoint: String {
        case pokemonList = "/pokemon?limit=20&offset="
        case pokemonItem = "/pokemon/"
    }
    
    func getPokemonListData(offset: Int,completition: @escaping (Result<PokemonListResponse, APIServiceError>) -> Void) {
        let urlString = Constants.URL.baseURL.rawValue + Endpoint.pokemonList.rawValue + "\(offset)"
        guard let url = URL(string: urlString) else {
            completition(.failure(.invalidEndpoint))
            return
        }
        
        let task = urlSession.dataTask(with: url) { result in
            switch result {
            case .success((let response, let data)):
                guard let statusCode = (response as? HTTPURLResponse)?.statusCode, 200..<299 ~= statusCode else {
                    completition(.failure(.invalidResponse))
                    return
                }
                do {
                    let values = try JSONDecoder().decode(PokemonListResponse.self, from: data)
                    completition(.success(values))
                } catch  {
                    debugPrint(error.localizedDescription)
                    completition(.failure(.decodeError))
                }
            case .failure(let error):
                debugPrint(error.localizedDescription)
                completition(.failure(.apiError))
                
            }
        }
        task.resume()
    }
    
    func getPokemonListItemData(id: Int,completition: @escaping (Result<PokemonItemResponse, APIServiceError>) -> Void) {
        let urlString = Constants.URL.baseURL.rawValue + Endpoint.pokemonItem.rawValue + "\(id)"
        guard let url = URL(string: urlString) else {
            completition(.failure(.invalidEndpoint))
            return
        }
        let task = urlSession.dataTask(with: url) { result in
            switch result {
            case .success((let response, let data)):
                guard let statusCode = (response as? HTTPURLResponse)?.statusCode, 200..<299 ~= statusCode else {
                    completition(.failure(.invalidResponse))
                    return
                }
                do {
                    let values = try JSONDecoder().decode(PokemonItemResponse.self, from: data)
                    completition(.success(values))
                } catch  {
                    debugPrint(error.localizedDescription)
                    completition(.failure(.decodeError))
                }
            case .failure(let error):
                debugPrint(error.localizedDescription)
                completition(.failure(.apiError))
                
            }
        }
        task.resume()
    }
}
