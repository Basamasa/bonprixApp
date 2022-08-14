//
//  WebView.swift
//  BonprixApp
//
//  Created by Anzer Arkin on 14.08.22.
//

import SwiftUI

struct WebView: View {
    @ObservedObject var model: WebViewModel

    var body: some View {
        LoadingView(isShowing: $model.isLoading) {
            WebViewRepresentable(viewModel: model)
        }
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(model: WebViewModel(url: "http://www.google.com"))
    }
}
