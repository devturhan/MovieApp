//
//  MovieListViewControllerTests.swift
//  MovieAppTests
//
//  Created by Omer Turhan on 9.05.2019.
//  Copyright © 2019 Ömer Turhan. All rights reserved.
//
@testable import MovieApp
import SwiftyMocky
import XCTest

class MovieListViewControllerTests: XCTestCase {
    var sut: MovieListViewController!
    var mockMoviesWebService = MoviesWebServiceProtocolMock()

    override func setUp() {
        super.setUp()
        WebServiceProvider.shared.moviesWebService = mockMoviesWebService
        sut = Storyboard.main.instantiateViewController()
    }
    
    func test_configuredAdapter_whenBecomeActive(){
        let movies = [Movie.generateDummy(id: 1),
                      Movie.generateDummy(id: 2)]
        
        Perform(mockMoviesWebService,
                .fetchPopularMovies(
                    onPage: .any,
                    onSuccess: .any,
                    onError: .any,
                    perform: { (page, onSuccess, onError) in
            onSuccess(movies)
        }))
        
        let expectedAdapter = MovieListCollectionViewAdapter(collectionView: getDummyCollectionView(),
                                                             delegate: nil)
        expectedAdapter.dataSource = movies
        
        sut.becomeActive()
        XCTAssert(expectedAdapter.isEqual(sut.collectionViewAdapter))
    }
    
    func test_fetchMoviesOnSucceed(){
        let movies = [Movie.generateDummy(id: 1),
                      Movie.generateDummy(id: 2)]
        Perform(mockMoviesWebService,
                .fetchPopularMovies(
                    onPage: .any,
                    onSuccess: .any,
                    onError: .any,
                    perform: { (page, onSuccess, onError) in
                        onSuccess([])
                }))
        sut.becomeActive()
        sut.fetchMoviesOnSucceed(movies: movies)
        
        XCTAssert(sut.collectionViewAdapter?.dataSource == movies)
    }
    
    func getDummyCollectionView() -> UICollectionView {
        return UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    }
}


