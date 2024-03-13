//
//  AsyncImageProtocol.swift
//  TMDB
//
//  Created by Luis Gustavo on 13/03/24.
//

import SwiftUI

protocol AsyncImageProcessor {
    associatedtype ViewType: View
    func asyncImage(_ url: URL) -> ViewType
}

struct AsyncImageView: AsyncImageProcessor {
    typealias ViewType = AsyncImage
    
    func asyncImage(_ url: URL) -> some View {
        CacheAsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                ProgressView() {
                    Text(AppStrings.Image.title)
                        .foregroundColor(.gray)
                }
                .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                .frame(maxWidth: .infinity)
                .aspectRatio(contentMode: .fit)
                .frame(height: Size.heightPoster)
                .cornerRadius(CornerRadius.big)
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(CornerRadius.big)
            case .failure:
                Color.gray
                    .frame(maxWidth: .infinity)
                    .frame(height: Size.heightPoster)
                    .cornerRadius(CornerRadius.big)
            @unknown default:
                Image("Image")
            }
        }
    }
}
