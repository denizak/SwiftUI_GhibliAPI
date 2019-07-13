//
//  Movie.swift
//  ghibliapp
//
//  Created by Deni Zakya on 13/07/19.
//  Copyright © 2019 Deni Zakya. All rights reserved.
//

import Foundation

struct Movie: Decodable {
    let id: String
    let title: String
    let director: String
}
