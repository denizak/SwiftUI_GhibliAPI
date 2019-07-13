//
//  ContentView.swift
//  ghibliapp
//
//  Created by Deni Zakya on 13/07/19.
//  Copyright © 2019 Deni Zakya. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @ObjectBinding var viewModel = MovieListViewModel.create()
    
    var body: some View {
        VStack {
            Button(action: {
                self.viewModel.fetchMovies()
            }) {
                Text("Load")
            }
            List(self.viewModel.movies.identified(by: \.id)) { movie in
                MovieRow(movie: movie)
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
