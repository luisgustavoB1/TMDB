//
//  MoviePosterView.swift
//  TMDB
//
//  Created by Luis Gustavo on 13/03/24.
//

import SwiftUI

struct MoviePosterView: View {
    let movie: MovieModel
    var imageComponent: any AsyncImageProcessor
    
    var body: some View {
        AnyView(imageComponent.asyncImage(movie.posterURL!))
    }
}

#Preview {
    MoviePosterView(movie: ModelMock.movieModel, imageComponent: AsyncImageView())
}
