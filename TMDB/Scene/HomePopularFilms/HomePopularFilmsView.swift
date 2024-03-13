//
//  HomePopularFilmsView.swift
//  TMDB
//
//  Created by Luis Gustavo on 11/03/24.
//

import SwiftUI

struct HomePopularFilmsView<ViewModel: HomePopularFilmsViewModelProtocol>: View {

    @ObservedObject private var viewModel: ViewModel
    @State private var path: NavigationPath = NavigationPath()
    var imageComponent: any AsyncImageProcessor

    init(viewModel: ViewModel, imageComponent: any AsyncImageProcessor) {
        self.viewModel = viewModel
        self.imageComponent = imageComponent
    }

    var body: some View {
        NavigationStack(path: $path) {
            ScrollView {
                title
                list
            }
            .alert(isPresented: $viewModel.showAlert) { alertError }
            .background(.black)
            .navigationDestination(for: HomePopularFilmsRouter.self) { route in
                switch route {
                case .detail(let movie):
                    DetailViewBuilder.build(movie)
                }
            }
        }
        .onAppear {
            viewModel.fetchPopularMovies()
        }
    }

    private var title: some View {
        Text(AppStrings.HomePopularFilms.title)
            .foregroundColor(.gray)
            .font(.system(size: 22, weight: .medium, design: .rounded))
            .bold()
    }

    private var list: some View {
        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()], spacing: SpacerSize.big) {
            ForEach(viewModel.popularFilms) { movie in
                MoviePosterView(movie: movie, imageComponent: imageComponent)
                    .onAppear(){
                        viewModel.loadMoreContent(currentItem: movie)
                    }
                    .onTapGesture {
                        path.append(HomePopularFilmsRouter.detail(movie))
                    }
            }
        }
        .padding(.horizontal)
    }

    private var alertError: Alert {
        Alert(
            title: Text(AppStrings.ErrorDescriptions.title),
            message: Text(viewModel.error?.apiErrorDescription ?? AppStrings.ErrorDescriptions.defaultError),
            primaryButton: .default(
                Text(AppStrings.ErrorDescriptions.primaryButton),
                action: {
                viewModel.resetError()
                viewModel.fetchPopularMovies()
                }
            ),secondaryButton: .cancel()
        )
    }
}

#Preview {
    HomePopularFilmsBuilder.build()
}
