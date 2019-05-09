//
//  MovieDetailViewModel.swift
//  MovieApp
//
//  Created by Ömer Turhan on 7.05.2019.
//  Copyright © 2019 Ömer Turhan. All rights reserved.
//

import Foundation
protocol MovieDetailViewModelProtocol {
    func isBookmarked(movie: Movie) -> Bool
    func bookmarked(movie: Movie)
    func unBookmarked(movie: Movie)
}

class MovieDetailViewModel: MovieDetailViewModelProtocol {
    let localMovieService: MoviesLocalServiceProcotol! = LocalServiceProvider.shared.moviesLocalService
    
    func isBookmarked(movie: Movie) -> Bool {
        return localMovieService.isBookmarked(movie:movie)
    }
    
    func bookmarked(movie: Movie) {
        localMovieService.bookmarked(movie: movie)
    }
    
    func unBookmarked(movie: Movie) {
        localMovieService.unBookmarked(movie: movie)
    }
    
    
}


