//
//  ShopView.swift
//  BonprixApp
//
//  Created by Anzer Arkin on 13.08.22.
//

import SwiftUI

struct ShopView: View {
    var viewModel: ShopViewModel
    @State var text: String = ""

    var body: some View {
        NavigationView {
            ZStack {
                if let url = viewModel.url {
                    WebView(model: WebViewModel(url: url))
                }
            }
            .searchable(text: $text, placement: .navigationBarDrawer(displayMode: .always), prompt: "Suchen")
            .navigationTitle(viewModel.category?.label ?? "Shop")
        }
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView(viewModel: ShopViewModel(category: Category(label: "Shop", url: "www.google.com", image: nil, children: nil)))
    }
}
