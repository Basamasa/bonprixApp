//
//  WebView.swift
//  BonprixApp
//
//  Created by Anzer Arkin on 14.08.22.
//

import SwiftUI
import WebKit

struct WebViewRepresentable: UIViewRepresentable {
    @ObservedObject var viewModel: WebViewModel
    let webView = WKWebView()

    func makeCoordinator() -> Coordinator {
        Coordinator(self.viewModel)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        private var viewModel: WebViewModel
        
        init(_ viewModel: WebViewModel) {
            self.viewModel = viewModel
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            self.viewModel.isLoading = false
        }
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<WebViewRepresentable>) { }
    
    func makeUIView(context: Context) -> UIView {
        self.webView.navigationDelegate = context.coordinator

        if let url = URL(string: self.viewModel.url) {
            self.webView.load(URLRequest(url: url))
        }

        return self.webView
    }
}

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
