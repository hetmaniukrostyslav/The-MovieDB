//
//  MovieService.swift
//  The MovieDB (Test)
//
//  Created by Rostyslav Hetmaniuk on 3/7/18.
//  Copyright © 2018 Rostyslav Hetmaniuk. All rights reserved.
//

import Foundation

class MovieService {
    
    private let apiManager = ApiManager.instance
    private let movieRepository = MovieRepository.instance
    
    init() {
        
    }
    
    func getMovies(type: MoviesType,  onSuccess successCallback: ((_ movies: [Movie]?) -> Void)?,
                            onFailure failureCallback: ((_ errorMessage: String) -> Void)?){
        switch type {
        case .popular:
            apiManager.getMovie(method: "popular", onSuccess: { result in
                if let models = result{
                    self.movieRepository.popularList = models
                }else {
                    return
                }
                successCallback!(self.movieRepository.popularList)
            }, onFailure: { error in
                failureCallback!((error?.localizedDescription)!)
            })
            break
        case .topRated:
            apiManager.getMovie(method: "top_rated", onSuccess: { result in
                if let models = result{
                    self.movieRepository.topRatedList = models
                }else {
                    return
                }
                successCallback!(self.movieRepository.topRatedList)
            }, onFailure: { error in
                failureCallback!((error?.localizedDescription)!)
            })
            break
        case .upcoming:
            apiManager.getMovie(method: "upcoming", onSuccess: { result in
                if let models = result{
                    self.movieRepository.upcoming = models
                }else {
                    return
                }
                successCallback!(self.movieRepository.upcoming)
            }, onFailure: { error in
                failureCallback!((error?.localizedDescription)!)
            })
            break
        default:
            break
        }
    }
}
