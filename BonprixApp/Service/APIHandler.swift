//
//  APIHandler.swift
//  BonprixApp
//
//  Created by Anzer Arkin on 13.08.22.
//

import Foundation
import Combine

protocol APIHandlerType {
    func response<Request>(from request: Request) -> AnyPublisher<Request.Response, APIServiceError> where Request: RequestType
}

enum APIServiceError: Error {
    case responseError
    case parseError(Error)
}

final class APIHandler: APIHandlerType {
    private let baseURL: URL
    
    init(baseURL: URL = URL(string: "https://codechallenge.mobilelab.io/v1/bonprix/navigation")!) {
        self.baseURL = baseURL
    }
    
    func response<Request>(from request: Request) -> AnyPublisher<Request.Response, APIServiceError> where Request : RequestType {
        let urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)!
        
        var request = URLRequest(url: urlComponents.url!)
        request.addValue("N8Nx0OwOvo1iuN2ZkFHZlyVKBVgoIcy4tUHMppO5", forHTTPHeaderField: "x-api-key")
        
        let decoder = JSONDecoder()
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map { data, urlResponse in data }
            .mapError { _ in APIServiceError.responseError }
            .decode(type: Request.Response.self, decoder: decoder)
            .mapError(APIServiceError.parseError)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
