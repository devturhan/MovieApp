//
//  MovieExtensions.swift
//  MovieAppTests
//
//  Created by Omer Turhan on 9.05.2019.
//  Copyright © 2019 Ömer Turhan. All rights reserved.
//
@testable import MovieApp
import Foundation

extension Movie {
    static func generateDummy(id: Int) -> Movie {
        return Movie(
            id: id,
            title: "title",
            overview: "overview",
            imagePath: "imagepath",
            voteAverage: 1,
            releaseDate: "releaseDate")
    }
}
