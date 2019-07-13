//
//  GhibliApi.swift
//  ghibliapp
//
//  Created by Deni Zakya on 13/07/19.
//  Copyright © 2019 Deni Zakya. All rights reserved.
//

import Foundation
import Combine

protocol GhibliApi {
    func getMovies() -> AnyPublisher<[Movie], Error>
}

struct GhibliApiImpl: GhibliApi {
    
    func getMovies() -> AnyPublisher<[Movie], Error> {
        let url = URL(string: "https://ghibliapi.herokuapp.com/films")!
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Movie].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

class GhibliApiFactory {
    static func create() -> GhibliApi {
        return GhibliApiImpl()
    }
}
