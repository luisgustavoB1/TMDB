//
//  DetailView.swift
//  TMDB
//
//  Created by Luis Gustavo on 11/03/24.
//

import SwiftUI

struct DetailView: View {

    private var viewModel: DetailViewModel
    var imageComponent: any AsyncImageProcessor
    @Environment(\.presentationMode) var presentationMode

    init(viewModel: DetailViewModel, imageComponent: any AsyncImageProcessor) {
        self.viewModel = viewModel
        self.imageComponent = imageComponent
    }

    var body: some View {
        NavigationView {
            ZStack {
                imageBackground
                footer
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }

    private var imageBackground: some View {
        AnyView(imageComponent.asyncImage(viewModel.backdropPath!))
            .aspectRatio(contentMode: .fill)
            .edgesIgnoringSafeArea(.all)
    }

    private var footer: some View {
        VStack(spacing: .zero) {
            Spacer()
            topBlurGradient
            contentFooter
        }
    }

    private var contentFooter: some View {
        VStack {
            Text(viewModel.title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Text(viewModel.overview)
                .padding()
                .foregroundColor(.white)
            
            buttons
            
            HStack {
                Text(viewModel.buildStringDetail)
                    .font(.callout)
                    .foregroundColor(.white)
                Spacer()
            }
            .padding(.bottom, PaddingSize.md)
            .padding(.leading, PaddingSize.sm)
        }
        .frame(maxWidth: UIScreen.main.bounds.width)
        .edgesIgnoringSafeArea(.bottom)
        .background(.ultraThinMaterial.opacity(OpacitySize.big))
        
    }

    private var topBlurGradient: some View {
        LinearGradient(gradient: Gradient(colors: [Color.clear, Color.gray.opacity(OpacitySize.xsm)]), startPoint: .top, endPoint: .bottom)
            .frame(height: Size.linearGradient)
    }

    private var buttons: some View {
        HStack {
            Button(action: {
                // TODO: Abrir o filme
            }) {
                Label(AppStrings.Detail.watchFilmButton, systemImage: "play.fill")
                    .padding()
                    .foregroundColor(.black)
                   
            }
            .frame(maxWidth: .infinity)
            .background(.white)
            .cornerRadius(CornerRadius.big)
            
            
            Button(action: {
                // TODO: Abrir o trailer
            }) {
                Text(AppStrings.Detail.trailerButton)
                    .padding()
                    .foregroundColor(.white)
            }
            .overlay(
                RoundedRectangle(cornerRadius: CornerRadius.md)
                .stroke(.white, lineWidth: 2)
            )
        }
        .padding()
    }
    
    private var backButton: some View {
        ZStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.white)
                    .padding()
            }
        }
        
    }
}

#Preview {
    DetailViewBuilder.build(ModelMock.movieModel)
}

