//
//  DetailViewModel.swift
//  TMDB
//
//  Created by Luis Gustavo on 11/03/24.
//

import Combine
import Foundation

protocol DetailViewModelProtocol {
    func getTitle() -> String
    func getOverview() -> String
    func getBackdropPath() -> URL
}

class DetailViewModel: ObservableObject {

    private var movie: MovieModel
    let numberPercent: Double = 10

    init(movie: MovieModel) {
        self.movie = movie
    }

    var title: String {
        movie.title
    }

    var overview: String {
        movie.overview
    }

    var backdropPath: URL? {
        movie.backdropURL
    }

    var buildStringDetail: String {
        let language = movie.originalLanguage.uppercased()
        let year = movie.releaseYear ?? "-"
        let rating = voteAverage

        return "\(language) • \(year) • ✯ \(rating)"
    }
}

private extension DetailViewModel {
    var voteAverage: String {
        let voteAverage = movie.voteAverage
        let result = round(voteAverage * numberPercent) / numberPercent
        return result.description
    }
}
