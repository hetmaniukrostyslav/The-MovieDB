//
//  MovieListPresenter.swift
//  The MovieDB (Test)
//
//  Created by Rostyslav Hetmaniuk on 3/4/18.
//  Copyright © 2018 Rostyslav Hetmaniuk. All rights reserved.
//

import Foundation
import UIKit

enum MoviesType{
    case topRated
    case popular
    case upcoming
}

struct MovieViewData{
    let title: String
    let releaseData: String
    let poster: UIImage
}

protocol MovieListView: NSObjectProtocol {
    func setMovies(movies: [MovieViewData])
}


class MovieListPresenter {
    private let movieService: MovieService
    weak private var movieListView: MovieListView?
    
    init(movieService: MovieService) {
        self.movieService = movieService
    }
    
    func attachView(view:MovieListView){
        movieListView = view
    }
    
    func getMovies(type: MoviesType){
        self.movieService.getMovies(type: type, onSuccess: { result in
        
        }) { error in
            
        }
    }
}

