//
//  ShopView.swift
//  BonprixApp
//
//  Created by Anzer Arkin on 13.08.22.
//

import SwiftUI

struct LeafView: View {
    var viewModel: LeafViewModel
    @State var text: String = ""

    var body: some View {
        VStack {
            if let url = viewModel.url {
                WebView(model: WebViewModel(url: url))
            }
        }
        .searchable(text: $text, placement: .navigationBarDrawer(displayMode: .always), prompt: "Suchen")
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(viewModel.category?.label ?? "Shop")
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        LeafView(viewModel: LeafViewModel(category: Category(label: "Shop", url: "www.google.com", image: nil, children: nil)))
    }
}
