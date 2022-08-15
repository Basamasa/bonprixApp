//
//  ContenViewModel.swift
//  BonprixApp
//
//  Created by Anzer Arkin on 13.08.22.
//

import Foundation
import Combine
import SwiftUI

final class ContenViewModel: ObservableObject {
    
    private var apiHandler: APIHandlerType
    private let onAppearSubject = PassthroughSubject<Void, Never>()
    private let responseSubject = PassthroughSubject<Welcome, Never>()
    private let errorSubject = PassthroughSubject<APIServiceError, Never>()
    private var cancellables: [AnyCancellable] = []

    @Published var categories: [Category] = []
    @Published var errorMessage = "Enable to connect"
    @Published var isErrorShown = false
    
    var shopCategory: Category {
        if categories.isEmpty {
            return Category(label: "Shop", url: nil, image: nil, children: nil)
        }
        return categories[0]
    }
    
    var assortmentCategories: [Category] {
        if categories.count > 1 {
            return Array(categories[1...])
        }
        return []
    }
    
    init(apiHandler: APIHandlerType = APIHandler()) {
        self.apiHandler = apiHandler
        setUpInput()
        setUpOutput()
    }
    
    func viewAppeared() {
        onAppearSubject.send()
    }
    
    private func setUpInput() {
        let responsePublisher = onAppearSubject.flatMap { [apiHandler] in
            apiHandler.response(from: APIRequest())
                .catch { [weak self] error -> Empty<Welcome, Never> in
                    self?.errorSubject.send(error)
                    return .init()
                }
        }
            .share()
            .subscribe(responseSubject)
        
        cancellables += [
            responsePublisher
        ]
    }
    
    private func setUpOutput() {
        let repositoriesStream = responseSubject
            .map { $0.categories }
            .assign(to: \.categories, on: self)
        
        let errorMessageStream = errorSubject
            .map { error -> String in
                switch error {
                case .responseError: return "network error"
                case .parseError(let errMessage) : return "parse error: \(errMessage)"
                }
            }
            .assign(to: \.errorMessage, on: self)
        
        let errorStream = errorSubject
            .map { _ in true }
            .assign(to: \.isErrorShown, on: self)
        
        cancellables += [
            repositoriesStream,
            errorStream,
            errorMessageStream
        ]
    }
}
