//
//  MovieListLayout.swift
//  MovieApp
//
//  Created by Ömer Turhan on 7.05.2019.
//  Copyright © 2019 Ömer Turhan. All rights reserved.
//

import Foundation
import DisplaySwitcher

protocol MovieListLayout: class {
    var layout: DisplaySwitchLayout { get }
    var layoutState: LayoutState { get }
}
