//
//  Moview.swift
//  MovieApp
//
//  Created by Ömer Turhan on 7.05.2019.
//  Copyright © 2019 Ömer Turhan. All rights reserved.
//

import Foundation

class Movie: Codable {
    let id: Int?
    let title: String?
    let overview: String?
    let imagePath: String
    let voteAverage: Double?
    let releaseDate: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case imagePath = "backdrop_path"
        case voteAverage = "vote_average"
        case releaseDate = "release_date"
    }
    
    init(id: Int,
         title: String,
         overview: String,
         imagePath: String,
         voteAverage:Double,
         releaseDate:String) {
        self.id = id
        self.title = title
        self.overview = overview
        self.imagePath = imagePath
        self.voteAverage = voteAverage
        self.releaseDate = releaseDate
    }
    
    public required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try values.decode(Int?.self, forKey: .id)
        self.title = try values.decode(String?.self, forKey: .title)
        self.overview = try values.decode(String?.self, forKey: .overview)
        if let path = try values.decode(String?.self, forKey: .imagePath) {
                imagePath = "https://image.tmdb.org/t/p/w200/\(path)"
        }else {
                imagePath = ""
        }
        self.voteAverage = try values.decode(Double?.self, forKey: .voteAverage)
        self.releaseDate = try values.decode(String?.self, forKey: .releaseDate)
    }
    
}

extension Movie: Equatable {
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        if lhs.id != rhs.id { return false }
        return true
    }
    
    
}
