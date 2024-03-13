//
//  Util.swift
//  TMDB
//
//  Created by Luis Gustavo on 12/03/24.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

enum APIError: Error {
    case invalidResponse
    case invalidData

    var apiErrorDescription: String? {
        switch self {
        case .invalidData:
            return AppStrings.ErrorDescriptions.invalidData
        case .invalidResponse:
            return AppStrings.ErrorDescriptions.invalidResponse
        }
    }
}
