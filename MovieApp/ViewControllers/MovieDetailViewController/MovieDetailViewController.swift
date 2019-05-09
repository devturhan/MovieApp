//
//  MovieDetailViewController.swift
//  MovieApp
//
//  Created by Ömer Turhan on 7.05.2019.
//  Copyright © 2019 Ömer Turhan. All rights reserved.
//

import Foundation
import UIKit

class MovieDetailViewController: BaseViewController {
    //Injected Properties
    var movie: Movie!
    
    @IBOutlet weak var movieDetailTableView: UITableView!
    
    var viewModel: MovieDetailViewModel!
    var movieDetailTableViewAdapter: MovieDetailTableViewAdapter?
    
    static func instatiate(movie: Movie) -> MovieDetailViewController {
        let vc: MovieDetailViewController = Storyboard.main.instantiateViewController()
        vc.movie = movie
        return vc
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Movie Detail"
        setupViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        movieDetailTableViewAdapter = MovieDetailTableViewAdapter(
            tableView: movieDetailTableView, dataSource: movie)
        configureBookmarkButton()
    }
    
    func setupViewModel(){
        viewModel = MovieDetailViewModel()
    }
    
    func configureBookmarkButton(){
        let image: UIImage = viewModel.isBookmarked(movie: movie) ? #imageLiteral(resourceName: "bookmarkFilled") : #imageLiteral(resourceName: "bookmarkUnFilled")
        let rightBarButtonItem = UIBarButtonItem.init(image: image, style: .plain, target: self, action: #selector(MovieDetailViewController.bookmarkButtonClicked))
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    @objc func bookmarkButtonClicked(){
        if viewModel.isBookmarked(movie: movie) {
            viewModel.unBookmarked(movie: movie)
        }else {
            viewModel.bookmarked(movie: movie)
        }
        configureBookmarkButton()
    }
    
    
}


