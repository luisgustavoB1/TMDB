//
//  HomePopularTests.swift
//  TMDBTests
//
//  Created by Luis Gustavo on 12/03/24.
//

@testable import TMDB
import SnapshotTesting
import SwiftUI
import XCTest
import Combine

final class HomePopularTests: XCTestCase {
    private var cancellables: [AnyCancellable] = []
    
    // MARK: - View Model
    func test_fetch_successResponse() {
        let mockService = MockHomePopularService()
        let mockData = ModelMock.list
        mockService.mockData = mockData
        
        let viewModel = HomePopularFilmsViewModel(homeService:  mockService)
        let expectation = XCTestExpectation(description: "Network fetch successful")
        viewModel.fetchPopularMovies()
        
        viewModel.$popularFilms.sink { result in
            if result.count > 0 {
                XCTAssertEqual(result, mockData.results)
                expectation.fulfill()
            }
        }.store(in: &cancellables)
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func test_fetch_failurefulResponse() {
        let mockService = MockHomePopularService()
        mockService.mockError = APIError.invalidData
        
        let viewModel = HomePopularFilmsViewModel(homeService:  mockService)
        let expectation = XCTestExpectation(description: "Network fetch failureful")
        viewModel.fetchPopularMovies()
        
        viewModel.$error.sink { error in
            if let error {
                XCTAssertTrue(error == APIError.invalidData)
                expectation.fulfill()
            }
        }.store(in: &cancellables)
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    // MARK: View
    
    func test_show_successResponse() {
        let imageName: String = "posterImage"
        let mockService = MockHomePopularService()
        let mockData = ModelMock.list
        mockService.mockData = mockData

        let viewModel = HomePopularViewModelMock(homeService: mockService)
        let view = HomePopularFilmsView(viewModel: viewModel, imageComponent: AsyncImageViewMock(imageName: imageName))
        let controller: UIViewController = UIHostingController(rootView: view)

        assertSnapshot(of: controller, as: .image(on: .iPhone13Pro))
    }
}
