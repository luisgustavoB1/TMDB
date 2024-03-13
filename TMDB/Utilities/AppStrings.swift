//
//  AppStrings.swift
//  TMDB
//
//  Created by Luis Gustavo on 12/03/24.
//

import Foundation

enum AppStrings {
    enum ErrorDescriptions {
        static let invalidData =  "There was an error fetching your data from server"
        static let invalidResponse = "An error happened when fetching data, please try again"
        static let defaultError = "There was an error fetching your data from server"
        static let title = "Error"
        static let primaryButton = "Retry"
    }

    enum HomePopularFilms {
        static let title = "Popular"
    }

    enum Detail {
        static let watchFilmButton = "Watch Movie"
        static let trailerButton = "Trailer"
    }
    
    enum Image {
        static let title = "Loading..."
    }
}
