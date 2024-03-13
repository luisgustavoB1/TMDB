//
//  NetworkServiceProtocol.swift
//  TMDB
//
//  Created by Luis Gustavo on 12/03/24.
//

import Foundation
import Combine

protocol APIClient {
    associatedtype EndpointType: APIEndpoint
    func request<T: Decodable>(_ endpoint: EndpointType) -> AnyPublisher<T, Error>
}
