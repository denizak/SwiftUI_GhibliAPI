//
//  MovieListViewModel.swift
//  ghibliapp
//
//  Created by Deni Zakya on 13/07/19.
//  Copyright © 2019 Deni Zakya. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class MovieListViewModel: BindableObject {
    
    let api: GhibliApi
    
    init(api: GhibliApi) {
        self.api = api
    }
    
    public let didChange = PassthroughSubject<[Movie], Never>()
    
    var movies: [Movie] = [Movie]() {
        didSet {
            didChange.send(movies)
        }
    }
    
    func fetchMovies() {
        _ = api.getMovies()
            .receive(on: RunLoop.main)
            .sink { [weak self] movies in
            self?.movies = movies
        }
    }
}

extension MovieListViewModel {
    static func create() -> MovieListViewModel {
        return MovieListViewModel(api: GhibliApiFactory.create())
    }
}
