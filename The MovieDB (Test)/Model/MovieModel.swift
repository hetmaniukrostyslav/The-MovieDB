//
//  MovieModel.swift
//  The MovieDB (Test)
//
//  Created by Rostyslav Hetmaniuk on 3/6/18.
//  Copyright © 2018 Rostyslav Hetmaniuk. All rights reserved.
//

import Foundation
import SwiftyJSON

struct MovieDBobject {
    let totalPages, page: Int
    let results: [Movie]
    let totalResults: Int
}


struct Movie {
    let posterPath: String!
    let id: Int!
    let releaseDate: String!
    let title: String!
}

