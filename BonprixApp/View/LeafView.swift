//
//  ShopView.swift
//  BonprixApp
//
//  Created by Anzer Arkin on 13.08.22.
//

import SwiftUI

struct LeafView: View {
    var viewModel: LeafViewModel

    var body: some View {
        VStack {
            if let url = viewModel.url {
                WebView(model: WebViewModel(url: url))
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(viewModel.category?.label ?? "Shop")
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        LeafView(viewModel: LeafViewModel(category: Category(label: "Shop", url: "www.google.com", image: nil, children: nil)))
    }
}
