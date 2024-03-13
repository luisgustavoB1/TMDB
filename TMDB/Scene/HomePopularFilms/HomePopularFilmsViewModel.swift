//
//  HomePopularFilmsViewModel.swift
//  TMDB
//
//  Created by Luis Gustavo on 11/03/24.
//

import Foundation
import SwiftUI
import Combine

protocol HomePopularFilmsViewModelProtocol: ObservableObject {
    var homeService: HomePopularFilmsServiceProtocol { get }
    var popularFilms: [MovieModel] { get set }
    var error: APIError? { get set }
    var showAlert: Bool { get set }

    func loadMoreContent(currentItem item: MovieModel)
    func fetchPopularMovies()
    func resetError()
}

class HomePopularFilmsViewModel: HomePopularFilmsViewModelProtocol {

    @Published var popularFilms: [MovieModel] = []
    @Published var error: APIError?
    @Published var showAlert: Bool = false

    private var page = 1
    private var totalPages = 1
    private var cancellables = Set<AnyCancellable>()
    private var listOffset = 10
    internal var homeService: HomePopularFilmsServiceProtocol

    init(homeService: HomePopularFilmsServiceProtocol = HomePopularFilmsService() ) {
        self.homeService = homeService
    }

    func fetchPopularMovies() {
        homeService.fetchPopularMovies(page: page)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { [weak self] data in
                if case .failure(let failure) = data {
                    self?.error = failure as? APIError
                    self?.showAlert = true
                }
            }, receiveValue: { [weak self] data in
                self?.popularFilms.append(contentsOf: data.results)
                self?.totalPages = data.totalPages
            }).store(in: &cancellables)
    }

    func loadMoreContent(currentItem item: MovieModel) {
        let itemIndex = popularFilms.firstIndex(of: item) ?? 0
        let shouldLoad = itemIndex == (popularFilms.count - listOffset)
        if shouldLoad {
            page += 1
            fetchPopularMovies()
        }
    }

    func resetError() {
        error = nil
        showAlert = false
    }
}
