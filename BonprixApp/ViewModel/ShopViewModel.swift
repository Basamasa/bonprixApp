//
//  ChildViewModel.swift
//  BonprixApp
//
//  Created by Anzer Arkin on 14.08.22.
//

import Foundation

final class ShopViewModel {
    var webModel: WebViewModel?
    var category: Category?
    
    var label: String? {
        category?.label
    }
    
    var url: String? {
        category?.url
    }
    
    init(category: Category?) {
        self.category = category
        if category?.url != nil {
            self.webModel = WebViewModel(url: (category?.url)!)
        }
    }
}
