//
//  HomePopularFilmsService.swift
//  TMDB
//
//  Created by Luis Gustavo on 12/03/24.
//

import Foundation
import Combine

protocol HomePopularFilmsServiceProtocol {
    func fetchPopularMovies(page: Int) -> AnyPublisher<ListMoviesResponse, Error>
}

class HomePopularFilmsService: HomePopularFilmsServiceProtocol {
    let apiClient = URLSessionAPIClient<MoviesEndpoint>()

    func fetchPopularMovies(page: Int) -> AnyPublisher<ListMoviesResponse, Error> {
        return apiClient.request(.popularMovies(page: page))
    }
}
