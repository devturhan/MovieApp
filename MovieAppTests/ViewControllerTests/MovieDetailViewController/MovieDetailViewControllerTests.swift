//
//  MovieDetailViewControllerTests.swift
//  MovieAppTests
//
//  Created by Omer Turhan on 9.05.2019.
//  Copyright © 2019 Ömer Turhan. All rights reserved.
//
@testable import MovieApp
import XCTest
import SwiftyMocky

class MovieDetailViewControllerTests: XCTestCase {
    var sut: MovieDetailViewController!
    var mockMoviesWebService = MoviesWebServiceProtocolMock()
    var mockMoviesLocalService = MoviesLocalServiceProcotolMock()
   
    override func setUp() {
        super.setUp()
        WebServiceProvider.shared.moviesWebService = mockMoviesWebService
        LocalServiceProvider.shared.moviesLocalService = mockMoviesLocalService
        Given(mockMoviesLocalService, .isBookmarked(movie: .any, willReturn: false))
    }
    
    func test_configuredAdapter_whenBecomeActive() {
        let movie = Movie.generateDummy(id: 1)
        sut = MovieDetailViewController.instatiate(movie: movie)
        let expectedAdapter = MovieDetailTableViewAdapter.init(tableView: UITableView(), dataSource: movie)
        sut.becomeActive()
        XCTAssert(expectedAdapter.isEqual(sut.movieDetailTableViewAdapter))
    }
    
    func test_bookmarkButtonClick_unBookmark(){
        let movie = Movie.generateDummy(id: 1)
        sut = MovieDetailViewController.instatiate(movie: movie)
        sut.becomeActive()
        Given(mockMoviesLocalService, .isBookmarked(movie: .any, willReturn: true))
        sut.bookmarkButtonClicked()
        Verify(mockMoviesLocalService, .unBookmarked(movie: .value(movie)))
        
    }
    
    func test_bookmarkButtonClick_bookmark(){
        let movie = Movie.generateDummy(id: 1)
        sut = MovieDetailViewController.instatiate(movie: movie)
        sut.becomeActive()
        Given(mockMoviesLocalService, .isBookmarked(movie: .any, willReturn: false))
        sut.bookmarkButtonClicked()
        Verify(mockMoviesLocalService, .bookmarked(movie: .value(movie)))
    }
}
