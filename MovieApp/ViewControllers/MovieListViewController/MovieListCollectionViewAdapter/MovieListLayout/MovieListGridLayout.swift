//
//  MovieListGridLayout.swift
//  MovieApp
//
//  Created by Ömer Turhan on 7.05.2019.
//  Copyright © 2019 Ömer Turhan. All rights reserved.
//

import Foundation
import DisplaySwitcher

class MovieListGridLayout: MovieListLayout {
    let layout: DisplaySwitchLayout
    let layoutState: LayoutState
    
    init() {
        layoutState = .grid
        layout = DisplaySwitchLayout(
            staticCellHeight: 200,
            nextLayoutStaticCellHeight: 200,
            layoutState: layoutState)
    }
}


