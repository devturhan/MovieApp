//
//  MovieListCollectionViewAdapter.swift
//  MovieApp
//
//  Created by Ömer Turhan on 7.05.2019.
//  Copyright © 2019 Ömer Turhan. All rights reserved.
//

import Foundation
import UIKit
import DisplaySwitcher
//sourcery: AutoMockable
protocol MovieListCollectionViewAdapterDelegate:class {
    func scrolledToBottom()
    func didSelect(movie: Movie)
}

class MovieListCollectionViewAdapter: NSObject {
    
    weak var collectionView: UICollectionView?
    weak var delegate: MovieListCollectionViewAdapterDelegate?
    var dataSource: [Movie] = []
    var currentLayout: MovieListLayout = MovieListGridLayout()
    
    init(collectionView: UICollectionView,
         delegate: MovieListCollectionViewAdapterDelegate? ) {
        self.collectionView  = collectionView
        self.delegate = delegate
        super.init()
        configureCollectionView()
        registerCells()
    }
    
    func configureCollectionView(){
        collectionView?.collectionViewLayout = currentLayout.layout
        collectionView?.delegate = self
        collectionView?.dataSource = self
    }
    
    func registerCells(){
        let cellBundle = Bundle(for: MovieListCollectionViewCell.self)
        collectionView?.register(UINib(nibName: "MovieListCollectionViewCell", bundle: cellBundle),
                                 forCellWithReuseIdentifier: "MovieListCollectionViewCell")
    }
    
    func appendNewMovies(movies: [Movie]){
        dataSource.append(contentsOf: movies)
        collectionView?.reloadData()
    }
    
    func invertLayout(){
        let transitionManager: TransitionManager
        let animationDuration = 0.3
        switch currentLayout.layoutState {
        case .grid:
            currentLayout = MovieListFlowLayout()
            transitionManager = TransitionManager(duration: animationDuration, collectionView: collectionView!, destinationLayout: currentLayout.layout, layoutState: .list)
        case .list:
            currentLayout = MovieListGridLayout()
            transitionManager = TransitionManager(duration: animationDuration, collectionView: collectionView!, destinationLayout: currentLayout.layout, layoutState: .grid)
        }
        transitionManager.startInteractiveTransition()
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let adapter = object as? MovieListCollectionViewAdapter else { return false }
        if adapter.dataSource != self.dataSource { return false }
        return true
    }
    
}

extension MovieListCollectionViewAdapter: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView
            .dequeueReusableCell(
                withReuseIdentifier: "MovieListCollectionViewCell", for: indexPath) as? MovieListCollectionViewCell else {
                    fatalError("Couldn't deque MovieListCollectionViewCell on MovieListCollectionViewAdapter")
        }
        let movie = dataSource[indexPath.row]
        let cellViewModel = MovieListCollectionViewCellViewModel(movie: movie)
        cell.configure(cellViewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.didSelect(movie: dataSource[indexPath.row])
    }
    
}


extension MovieListCollectionViewAdapter: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        transitionLayoutForOldLayout fromLayout: UICollectionViewLayout,
                        newLayout toLayout: UICollectionViewLayout) -> UICollectionViewTransitionLayout {
        let customTransitionLayout = TransitionLayout(currentLayout: fromLayout, nextLayout: toLayout)
        return customTransitionLayout
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y + scrollView.frame.height >= scrollView.contentSize.height {
            delegate?.scrolledToBottom()
        }
    }
    
    
    
}



