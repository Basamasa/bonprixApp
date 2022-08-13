//
//  ShopView.swift
//  BonprixApp
//
//  Created by Anzer Arkin on 13.08.22.
//

import SwiftUI

struct ShopView: View {
    @State var text: String = ""
    var webModel: WebViewModel
    var label: String
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isErrorShown {
                    Text(viewModel.errorMessage)
                } else if viewModel.categories.isEmpty {
                    ProgressView()
                } else {
                    VStack {
                        TextField("Suchen", text: $text)
                        WebView(webView: WebViewModel(urlName: viewModel.categories[0].url!).webView)
                    }
                    .navigationTitle(viewModel.categories[0].label)
                }
            }
            .navigationViewStyle(.stack)
        }
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}
