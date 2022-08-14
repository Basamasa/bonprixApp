//
//  ReusableView.swift
//  BonprixApp
//
//  Created by Anzer Arkin on 14.08.22.
//

import SwiftUI

struct ReusableView: View {
    var title: String
    var categories: [Category]?
    
    var body: some View {
        VStack {
            if let categories = categories {
                ScrollView {
                    ForEach(categories, id: \.self) { category in
                        if category.url == nil {
                            NavigationLink(destination: ReusableView(title: category.label, categories: category.children)) {
                                Text("\(category.label)")
                            }
                        } else {
                            ShopView(viewModel: ShopViewModel(category: category))
                        }
                    }
                }
            } else {
                ProgressView()
            }
        }
        .navigationTitle(title)
    }
}

struct ReusableView_Previews: PreviewProvider {
    static var previews: some View {
        ReusableView(title: "Reusable")
    }
}
