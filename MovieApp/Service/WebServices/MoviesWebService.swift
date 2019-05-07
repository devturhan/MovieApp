//
//  MoviesWebService.swift
//  MovieApp
//
//  Created by Ömer Turhan on 7.05.2019.
//  Copyright © 2019 Ömer Turhan. All rights reserved.
//

import Foundation
import Alamofire

protocol MoviesWebServiceProtocol {
    func fetchPopularMovies(onPage page: Int,
                            onSuccess:@escaping ([Movie])->Void,
                            onError:@escaping (Error) -> Void)
}

class MoviesWebService: BaseWebService, MoviesWebServiceProtocol {
    
    func fetchPopularMovies(onPage page: Int,
                            onSuccess: @escaping ([Movie]) -> Void,
                            onError: @escaping (Error) -> Void) {
        let requestOnSuccess : (MovieListBaseResponse)-> Void = { (response) in
            onSuccess(response.results)
        }
        
        self.request(urlString: "https://api.themoviedb.org/3/movie/popular?language=en-US&api_key=fd2b04342048fa2d5f728561866ad52a&page=\(page)",
                     onSuccess: requestOnSuccess,
                     onError: onError)
    }
    
    
}

class MovieListBaseResponse:Decodable {
    let results:[Movie]
}

