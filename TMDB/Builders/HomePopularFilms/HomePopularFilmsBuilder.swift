//
//  HomePopularFilmsBuilder.swift
//  TMDB
//
//  Created by Luis Gustavo on 13/03/24.
//

import SwiftUI

struct HomePopularFilmsBuilder {
    static func build() -> some View {
        HomePopularFilmsView(viewModel: HomePopularFilmsViewModel(), imageComponent: AsyncImageView())
    }
}
