//
//  MovieDetailTableViewCell.swift
//  MovieApp
//
//  Created by Ömer Turhan on 7.05.2019.
//  Copyright © 2019 Ömer Turhan. All rights reserved.
//

import UIKit

struct MovieDetailTableViewCellViewModel {
    let movie: Movie
}

class MovieDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var averageVoteLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    var viewModel: MovieDetailTableViewCellViewModel?
    
    func configure(_ viewModel: MovieDetailTableViewCellViewModel) {
        self.viewModel = viewModel
        self.posterImageView.loadFrom(viewModel.movie.imagePath)
        self.titleLabel.text = viewModel.movie.title ?? ""
        if let averageVote = viewModel.movie.voteAverage {
            self.averageVoteLabel.text = "Average Vote: \(averageVote)"
        }
        self.overviewLabel.text = viewModel.movie.overview ?? ""
    }
    
}
