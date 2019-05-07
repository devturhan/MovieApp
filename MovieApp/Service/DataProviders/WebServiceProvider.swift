//
//  WebServiceProvider.swift
//  MovieApp
//
//  Created by Ömer Turhan on 7.05.2019.
//  Copyright © 2019 Ömer Turhan. All rights reserved.
//

import Foundation

class WebServiceProvider {
    static let shared: WebServiceProvider = WebServiceProvider()
    var moviesWebService: MoviesWebServiceProtocol!
    
    private init (){
        moviesWebService = MoviesWebService()
    }
    
}
