//
//  TMDBApp.swift
//  TMDB
//
//  Created by Luis Gustavo on 11/03/24.
//

import SwiftUI

@main
struct TMDBApp: App {
    var body: some Scene {
        WindowGroup {
            HomePopularFilmsBuilder.build()
        }
    }
}
