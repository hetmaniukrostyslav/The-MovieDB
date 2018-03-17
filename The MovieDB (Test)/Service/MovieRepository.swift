//
//  MovieRepository.swift
//  The MovieDB (Test)
//
//  Created by Rostyslav Hetmaniuk on 3/17/18.
//  Copyright © 2018 Rostyslav Hetmaniuk. All rights reserved.
//

import Foundation

public class MovieRepository {
    
    static let instance = MovieRepository()
    
    private init(){
        
    }
    
    var topRatedList: [Movie]!
    var popularList: [Movie]!
    var upcoming: [Movie]!
}
