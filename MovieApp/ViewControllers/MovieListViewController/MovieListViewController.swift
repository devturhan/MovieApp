//
//  ViewController.swift
//  MovieApp
//
//  Created by Ömer Turhan on 7.05.2019.
//  Copyright © 2019 Ömer Turhan. All rights reserved.
//

import UIKit

class MovieListViewController: BaseViewController {
    @IBOutlet weak var movieListCollectionView: UICollectionView!
    
    var viewModel: MovieListViewModelProtocol!
    var collectionViewAdapter: MovieListCollectionViewAdapter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
        setupCollectionViewAdapter()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchMovies()
    }
    
    func setupViewModel(){
        viewModel = MovieListViewModel()
        viewModel.delegate = self
    }
    
    func setupCollectionViewAdapter(){
        collectionViewAdapter = MovieListCollectionViewAdapter(
            collectionView: movieListCollectionView,
            delegate: self)
    }
    
    @IBAction func layoutChangeButtonClicked(_ sender: Any) {
        collectionViewAdapter?.invertLayout()
    }
}

extension MovieListViewController: MovieListViewModelDelegate {
    func fetchMoviesOnSucceed(movies: [Movie]) {
        collectionViewAdapter?.appendNewMovies(movies: movies)
    }
    
    func fetchMoviesOnError(error: Error) {
        print("Error Occured on \(#function) : \(error)")
    }
    
}

extension MovieListViewController: MovieListCollectionViewAdapterDelegate {
    func didSelect(movie: Movie) {
        let bundle = Bundle(for: MovieDetailViewController.self)
        if let  vc = UIStoryboard.init(name: "Main", bundle: bundle).instantiateViewController(withIdentifier: "MovieDetailViewController") as? MovieDetailViewController {
            vc.movie = movie
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func scrolledToBottom() {
        viewModel.fetchMovies()
    }
}





