//
//  MovieListViewController.swift
//  The MovieDB (Test)
//
//  Created by Rostyslav Hetmaniuk on 3/4/18.
//  Copyright © 2018 Rostyslav Hetmaniuk. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController, UITabBarDelegate {
    let presenter = MovieListPresenter(movieService: MovieService())
    
    @IBOutlet weak var tabBarView: UITabBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var test: UITabBarItem!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarView.delegate = self
        
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.tag {
        case 1:
            presenter.getMovies(type: .topRated)
            break
        case 2:
            presenter.getMovies(type: .popular)
            break
        case 3:
            presenter.getMovies(type: .upcoming)
            break
        default:
            break
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MovieListViewController: MovieListView {
    func setMovies(movies: [MovieViewData]) {
        
    }
}
