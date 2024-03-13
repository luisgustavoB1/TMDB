//
//  Mock.swift
//  TMDB
//
//  Created by Luis Gustavo on 13/03/24.
//

struct ModelMock {
    static var list = ListMoviesResponse(
        page: 1,
        results: movieModelList,
        totalPages: 100,
        totalResults: 5344
    )
    
    static var movieModelList: [MovieModel] = [
        MovieModel(
            backdropPath: "/meyhnvssZOPPjud4F1CjOb4snET.jpg",
            posterPath: "/meyhnvssZOPPjud4F1CjOb4snET.jpg",
            id: 940551,
            originalLanguage: "en",
            overview: "After a migrating duck family alights on their pond with thrilling tales of far-flung places, the Mallard family embarks on a family road trip, from New England, to New York City, to tropical Jamaica.",
            releaseDate: "2023-12-06",
            title: "Migration",
            voteAverage: 7.576
        ),
        MovieModel(
            backdropPath: "/meyhnvssZOPPjud4F1CjOb4snET.jpg",
            posterPath: "/meyhnvssZOPPjud4F1CjOb4snET.jpg",
            id: 940500,
            originalLanguage: "en",
            overview: "After a migrating duck family alights on their pond with thrilling tales of far-flung places, the Mallard family embarks on a family road trip, from New England, to New York City, to tropical Jamaica.",
            releaseDate: "2023-12-06",
            title: "Migration",
            voteAverage: 7.576
        )
    ]
    
    static var movieModel: MovieModel = MovieModel(
        backdropPath: "/meyhnvssZOPPjud4F1CjOb4snET.jpg",
        posterPath: "/meyhnvssZOPPjud4F1CjOb4snET.jpg",
        id: 940551,
        originalLanguage: "en",
        overview: "After a migrating duck family alights on their pond with thrilling tales of far-flung places, the Mallard family embarks on a family road trip, from New England, to New York City, to tropical Jamaica.",
        releaseDate: "2023-12-06",
        title: "Migration",
        voteAverage: 7.576
    )
    
    static var movieModelError: MovieModel = MovieModel(
        backdropPath: "",
        posterPath: "",
        id: 940551,
        originalLanguage: "en",
        overview: "After a migrating duck family alights on their pond with thrilling tales of far-flung places, the Mallard family embarks on a family road trip, from New England, to New York City, to tropical Jamaica.",
        releaseDate: "",
        title: "Migration",
        voteAverage: 7.576
    )
}
