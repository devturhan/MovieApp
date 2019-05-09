//
//  MovieListCollectionViewAdapterTests.swift
//  MovieAppTests
//
//  Created by Omer Turhan on 9.05.2019.
//  Copyright © 2019 Ömer Turhan. All rights reserved.
//
@testable import MovieApp
import XCTest
import SwiftyMocky

class MovieListCollectionViewAdapterTests: XCTestCase {
    var sut: MovieListCollectionViewAdapter!
    var mockDelegate = MovieListCollectionViewAdapterDelegateMock()
    
    func test_didSelect_triggerDelegate(){
        let movie = Movie.generateDummy(id: 1)
        let collectionView = getDummyCollectionView()
        sut = MovieListCollectionViewAdapter(collectionView: collectionView, delegate: mockDelegate)
        sut.appendNewMovies(movies: [movie])
        sut.collectionView(collectionView,
                           didSelectItemAt: IndexPath.init(row: 0, section: 0))
        Verify(mockDelegate, .didSelect(movie: Parameter<Movie>.value(movie)))
    }
    
    func test_cellForRowAt_cellConfiguration(){
        let movie = Movie.generateDummy(id: 1)
        let collectionView = getDummyCollectionView()
        sut = MovieListCollectionViewAdapter(collectionView: collectionView, delegate: mockDelegate)
        sut.appendNewMovies(movies: [movie])
        
        if let cell = sut.collectionView(collectionView, cellForItemAt: IndexPath(item: 0, section: 0))
            as? MovieListCollectionViewCell {
            XCTAssert(cell.titleLabel.text == movie.title)
            XCTAssert(cell.posterImageView.sd_imageURL!.absoluteString == movie.imagePath)
            return
        }
        XCTFail("\(#function) Failed")
    }
    
    func getDummyCollectionView() -> UICollectionView {
        return UICollectionView(frame: UIScreen.main.bounds,
                                collectionViewLayout: UICollectionViewFlowLayout())
    }
}
