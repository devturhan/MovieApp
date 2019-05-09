//
//  MovieDetailTableViewAdapterTests.swift
//  MovieAppTests
//
//  Created by Ömer Turhan on 9.05.2019.
//  Copyright © 2019 Ömer Turhan. All rights reserved.
//
@testable import MovieApp
import XCTest
import SwiftyMocky

class MovieDetailTableViewAdapterTests: XCTestCase {

   var sut: MovieDetailTableViewAdapter!
    
    func test_numberOfSections() {
        let movie = Movie.generateDummy(id: 1)
        let tableView = UITableView()
        sut = MovieDetailTableViewAdapter(tableView: tableView, dataSource: movie)
        XCTAssert(sut.numberOfSections(in: tableView) == 1)
    }
    
    func test_numberOfRowsInSection() {
        let movie = Movie.generateDummy(id: 1)
        let tableView = UITableView()
        sut = MovieDetailTableViewAdapter(tableView: tableView, dataSource: movie)
        XCTAssert(sut.tableView(tableView, numberOfRowsInSection: 0) == 1)
    }
    
    func test_cellForRowAt_cellConfiguration() {
        let movie = Movie.generateDummy(id: 1)
        let tableView = UITableView()
        sut = MovieDetailTableViewAdapter(tableView: tableView, dataSource: movie)
        
        if let cell = sut.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? MovieDetailTableViewCell {
            XCTAssert(cell.titleLabel.text == movie.title)
            XCTAssert(cell.overviewLabel.text == movie.overview)
            XCTAssert(cell.averageVoteLabel.text == "Average Vote: \(movie.voteAverage!)" )
            XCTAssert(cell.posterImageView.sd_imageURL!.absoluteString == movie.imagePath)
            return
        }
        
        XCTFail()
    }
    
    

}
