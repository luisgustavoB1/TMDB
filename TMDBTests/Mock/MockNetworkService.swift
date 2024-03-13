//
//  MockNetworkService.swift
//  TMDBTests
//
//  Created by Luis Gustavo on 12/03/24.
//

import Foundation
import Combine
@testable import TMDB

class MockHomePopularService: HomePopularFilmsServiceProtocol {

  var mockData: ListMoviesResponse?
  var mockError: Error?

  func fetchPopularMovies(page: Int) -> AnyPublisher<ListMoviesResponse, Error> {
    return Future { [weak self] promise in
      guard let self = self else { return }
      if let error = self.mockError {
        promise(.failure(error))
        return
      }

      guard let data = self.mockData else {
          promise(.failure(APIError.invalidData))
        return
      }
      promise(.success(data))
    }
    .eraseToAnyPublisher()
  }
}
