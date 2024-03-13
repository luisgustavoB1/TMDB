//
//  DetailViewBuilder.swift
//  TMDB
//
//  Created by Luis Gustavo on 13/03/24.
//

import SwiftUI

struct DetailViewBuilder {
    static func build(_ movie: MovieModel) -> some View {
        DetailView(viewModel: .init(movie: movie), imageComponent: AsyncImageView())
    }
}
