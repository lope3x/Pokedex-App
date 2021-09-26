//
//  APIService.swift
//  PokemonApp
//
//  Created by Gabriel Lopes Ferreira on 05/03/21.
//

import Foundation

class APIService {
    let urlSession = URLSession.shared

    enum APIServiceError: Error {
        case apiError
        case invalidEndpoint
        case invalidResponse
        case noData
        case decodeError
    }
}
