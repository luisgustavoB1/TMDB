//
//  MockImage.swift
//  TMDBTests
//
//  Created by Luis Gustavo on 13/03/24.
//

import SwiftUI

struct MockImage: View {

    let image: String

    init(image: String) {
        self.image = image
    }

    var body: some View {
        Image(image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(10.0)
    }
}
