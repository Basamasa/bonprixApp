//
//  WebViewModel.swift
//  BonprixApp
//
//  Created by Anzer Arkin on 13.08.22.
//

import WebKit

final class WebViewModel: ObservableObject {
    @Published var url: String
    @Published var isLoading: Bool = true
    
    init (url: String) {
        self.url = url
    }
}
