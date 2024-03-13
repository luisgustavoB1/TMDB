//
//  MoviesEndpoint.swift
//  TMDB
//
//  Created by Luis Gustavo on 12/03/24.
//

import Foundation

enum MoviesEndpoint {
    case popularMovies(page: Int)
}

extension MoviesEndpoint: APIEndpoint {

    var baseURL: URL {
        guard let url = URL(string: APIConstants.baseURL) else { fatalError("Base URL isn't valid.") }
        return url
    }

    var path: String {
        switch self {
        case .popularMovies:
            APIConstants.Paths.popularMoviesPath
        }
    }

    var method: HTTPMethod {
        switch self {
        case .popularMovies:
            return .get
        }
    }

    var headers: [String: String]? {
        switch self {
        case .popularMovies:
            return ["Authorization": AppConstants.Authorization]
        }
    }

    var parameters: [String: Any]? {
        var parameters: [String: Any] =  ["language": "en-US"]
        switch self {
        case .popularMovies(let page):
            parameters["page"] = page
        }
        return parameters
    }
}
