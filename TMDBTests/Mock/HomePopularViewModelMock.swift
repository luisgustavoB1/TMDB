//
//  HomePopularViewModelMock.swift
//  TMDBTests
//
//  Created by Luis Gustavo on 12/03/24.
//

import Foundation
@testable import TMDB

class HomePopularViewModelMock: HomePopularFilmsViewModelProtocol {

    @Published var popularFilms: [MovieModel] = []
    @Published var error: APIError?
    var homeService: TMDB.HomePopularFilmsServiceProtocol

    var mockError: APIError?
    var showAlert: Bool = false
    
    init(homeService: HomePopularFilmsServiceProtocol = MockHomePopularService()) {
        self.homeService = homeService
    }

    func loadMoreContent(currentItem item: TMDB.MovieModel) {
        if let mockError = mockError {
            showAlert = true
            error = mockError
        } else {
            popularFilms = ModelMock.movieModelList
        }
    }

    func fetchPopularMovies() {
        if let mockError = mockError {
            showAlert = true
            error = mockError
        } else {
            popularFilms = ModelMock.movieModelList
        }
    }

    func resetError() {
        //
    }
}
