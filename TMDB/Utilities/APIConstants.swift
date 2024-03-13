//
//  APIConstants.swift
//  TMDB
//
//  Created by Luis Gustavo on 12/03/24.
//

import Foundation

enum APIConstants {
    static let baseURL = "https://api.themoviedb.org/3/movie"
    static var backdropPathURL = "https://image.tmdb.org/t/p/original/"
    static var posterPathURL = "https://image.tmdb.org/t/p/w500/"
    
    enum Paths {
        static let popularMoviesPath = "/popular"
    }
}
