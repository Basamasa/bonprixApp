//
//  ShopView.swift
//  BonprixApp
//
//  Created by Anzer Arkin on 13.08.22.
//

import SwiftUI

struct LeafView: View {
    var category: Category?

    var body: some View {
        VStack {
            if let url = category?.url {
                WebView(model: WebViewModel(url: url))
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(category?.label ?? "Shop")
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        LeafView(category: Category(label: "Shop", url: "www.google.com", image: nil, children: nil))
    }
}
