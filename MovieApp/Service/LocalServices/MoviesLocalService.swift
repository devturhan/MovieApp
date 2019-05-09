//
//  MoviesLocalService.swift
//  MovieApp
//
//  Created by Ömer Turhan on 7.05.2019.
//  Copyright © 2019 Ömer Turhan. All rights reserved.
//

import Foundation

//sourcery: AutoMockable
protocol MoviesLocalServiceProcotol {
    func isBookmarked(movie: Movie) -> Bool
    func bookmarked(movie: Movie)
    func unBookmarked(movie: Movie)
}

class MoviesLocalService: MoviesLocalServiceProcotol {
    private var bookmarkedMoviesDataSource = UserDefaultsDataSource<[Movie]>(key: UserDefaultsKeys.bookmarkedMovies.rawValue)
    
    func isBookmarked(movie: Movie) -> Bool {
        return bookmarkedMoviesDataSource.get()?.contains(movie) ?? false
    }
    
    func bookmarked(movie: Movie) {
        var bookmarkedMovies = bookmarkedMoviesDataSource.get() ?? []
        bookmarkedMovies.append(movie)
        bookmarkedMoviesDataSource.update(object: bookmarkedMovies)
    }
    
    func unBookmarked(movie: Movie) {
        if var bookmarkedMovies = bookmarkedMoviesDataSource.get() {
            bookmarkedMovies.removeAll(where: { $0.id == movie.id })
            bookmarkedMoviesDataSource.update(object: bookmarkedMovies)
        }
    }
    
    
    
}

