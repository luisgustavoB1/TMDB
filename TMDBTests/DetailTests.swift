//
//  DetailTests.swift
//  TMDBTests
//
//  Created by Luis Gustavo on 13/03/24.
//

@testable import TMDB
import XCTest
import SwiftUI
import SnapshotTesting

final class DetailTests: XCTestCase {
    
    // MARK: - View Model
    func test_viewModel_successResponse() {
        let mockData = ModelMock.movieModel
        let viewModel = DetailViewModel(movie: mockData)
        
        XCTAssertEqual(viewModel.backdropPath, mockData.backdropURL)
        XCTAssertEqual(viewModel.title, mockData.title)
        XCTAssertEqual(viewModel.overview, mockData.overview)
        XCTAssertEqual(viewModel.buildStringDetail,"EN • 2023 • ✯ 7.6")
    }

    func test_viewModel_successResponseWithMockError() {
        let mockData = ModelMock.movieModelError

        let viewModel = DetailViewModel(movie: mockData)

        XCTAssertEqual(viewModel.backdropPath, mockData.backdropURL)
        XCTAssertEqual(viewModel.title, mockData.title)
        XCTAssertEqual(viewModel.overview, mockData.overview)
        XCTAssertEqual(viewModel.buildStringDetail,"EN • - • ✯ 7.6")
    }
    
    func test_model_parameters() {
        let model: MovieModel = ModelMock.movieModelError

        XCTAssertEqual(model.posterURL, nil)
        XCTAssertEqual(model.backdropURL, nil)
        XCTAssertEqual(model.releaseYear, nil)
    }
    
    func test_show_screenDetail() {
        let imageName: String = "backdropImage"
        let mockData = ModelMock.movieModel

        let viewModel = DetailViewModel(movie: mockData)
        let view = DetailView(viewModel: viewModel, imageComponent: AsyncImageViewMock(imageName: imageName))

        let controller: UIViewController = UIHostingController(rootView: view)
        assertSnapshot(of: controller, as: .image(on: .iPhone13Pro))
    }
}
