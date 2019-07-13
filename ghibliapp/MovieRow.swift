//
//  MovieRow.swift
//  ghibliapp
//
//  Created by Deni Zakya on 13/07/19.
//  Copyright © 2019 Deni Zakya. All rights reserved.
//

import SwiftUI

struct MovieRow : View {
    var movie: Movie
    
    var body: some View {
        Text(movie.title)
    }
}

#if DEBUG
struct MovieRow_Previews : PreviewProvider {
    static var previews: some View {
        MovieRow(movie: Movie(id: "id", title: "title", director: "director"))
    }
}
#endif
