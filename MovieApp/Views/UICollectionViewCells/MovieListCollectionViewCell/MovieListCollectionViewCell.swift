//
//  MovieListCollectionViewCell.swift
//  MovieApp
//
//  Created by Ömer Turhan on 7.05.2019.
//  Copyright © 2019 Ömer Turhan. All rights reserved.
//

import UIKit

struct MovieListCollectionViewCellViewModel {
    let localMovieService: MoviesLocalServiceProcotol! = LocalServiceProvider.shared.moviesLocalService
    var movie: Movie
    func isMovieBookmarked() -> Bool {
        return localMovieService.isBookmarked(movie: movie)
    }
}

class MovieListCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var bookmarkImageView: UIImageView!
    
    var viewModel: MovieListCollectionViewCellViewModel?
    
    func configure(_ viewModel: MovieListCollectionViewCellViewModel) {
        self.viewModel = viewModel
        self.titleLabel.text = viewModel.movie.title
        self.posterImageView.loadFrom(viewModel.movie.imagePath)
        bookmarkImageView.isHidden = !viewModel.isMovieBookmarked()
    }

}
