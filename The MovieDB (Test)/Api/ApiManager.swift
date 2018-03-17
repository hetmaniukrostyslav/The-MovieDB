//
//  ApiManager.swift
//  The MovieDB (Test)
//
//  Created by Rostyslav Hetmaniuk on 3/7/18.
//  Copyright © 2018 Rostyslav Hetmaniuk. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import Alamofire_SwiftyJSON


public class ApiManager {
    private let apiKey = "6c054446fcdca1fb6dcb013cc6de68c1"
    private let url = "https://api.themoviedb.org/3"
    
    static let instance = ApiManager()
    
    private init(){
        
    }
    
    private func parseJson(data: Data!) -> [Movie]! {
        var result: [Movie] = []
        let json = JSON(data)
        if let results = json["results"].array {
            for item in results {
                let posterPath = item["poster_path"].string
                let id = item["id"].int
                let releaseDate = item["release_date"].string
                let title = item["title"].string
                result.append(Movie(posterPath: posterPath, id: id, releaseDate: releaseDate, title: title))
            }
            return result
        } else { return nil }
    }
    
    func getMovie(method: String, skip: Int = 0, onSuccess: @escaping ([Movie]?) -> Void, onFailure: @escaping (Error?) -> Void) {
        Alamofire.request ("\(url)/movie/\(method)", parameters: ["api_key": apiKey,"page": skip])
            .responseSwiftyJSON{ dataResponse in
                switch dataResponse.result {
                case .success:
                    let item = self.parseJson(data: dataResponse.data)
                    onSuccess(item)
                    break
                case .failure:
                    onFailure(dataResponse.error)
                    break
                }
            }
    }
}
