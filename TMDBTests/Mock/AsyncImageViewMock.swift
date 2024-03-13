//
//  AsyncImageViewMock.swift
//  TMDBTests
//
//  Created by Luis Gustavo on 13/03/24.
//

@testable import TMDB
import SwiftUI

struct AsyncImageViewMock: AsyncImageProcessor {
    typealias ViewType = MockImage
    
    let imageName: String
    
    init(imageName: String) {
        self.imageName = imageName
    }

    func asyncImage(_ url: URL) -> MockImage {
        MockImage(image: imageName)
    }
}
