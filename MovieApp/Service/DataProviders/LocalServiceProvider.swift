//
//  LocalServiceProvider.swift
//  MovieApp
//
//  Created by Ömer Turhan on 7.05.2019.
//  Copyright © 2019 Ömer Turhan. All rights reserved.
//

import Foundation

class LocalServiceProvider {
    static let shared: LocalServiceProvider = LocalServiceProvider()
    var moviesLocalService: MoviesLocalServiceProcotol!
    
    private init (){
        moviesLocalService = MoviesLocalService()
    }
    
}
