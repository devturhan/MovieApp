//
//  MovieListViewModel.swift
//  MovieApp
//
//  Created by Ömer Turhan on 7.05.2019.
//  Copyright © 2019 Ömer Turhan. All rights reserved.
//

import Foundation

protocol MovieListViewModelDelegate: class {
    func fetchMoviesOnSucceed(movies: [Movie])
    func fetchMoviesOnError(error: Error)
}

protocol MovieListViewModelProtocol {
    var delegate:MovieListViewModelDelegate? { get set }
    
    func fetchMovies()
}

class MovieListViewModel: BaseViewModel, MovieListViewModelProtocol {
    weak var delegate: MovieListViewModelDelegate?
    let moviesWebService: MoviesWebServiceProtocol = WebServiceProvider.shared.moviesWebService
    var lastFetchedPage: Int = 0
    
    func fetchMovies() {
        lastFetchedPage += 1
        moviesWebService
            .fetchPopularMovies(
                onPage: lastFetchedPage,
                onSuccess: { [weak self] (movies) in
                    self?.delegate?.fetchMoviesOnSucceed(movies: movies)
                }, onError: { [weak self](error) in
                    self?.delegate?.fetchMoviesOnError(error: error)
            })
    }
}
