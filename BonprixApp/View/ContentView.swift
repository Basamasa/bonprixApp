//
//  ContentView.swift
//  BonprixApp
//
//  Created by Anzer Arkin on 13.08.22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContenViewModel()
    
    var body: some View {
        TabView {
            ShopView(webModel: WebViewModel(urlName: viewModel.shopURL), label: viewModel.shopLabel)
                .tabItem {
                    Label("Shop", systemImage: "tray.and.arrow.down.fill")
                }
            SortimentView()
                .tabItem {
                    Label("Assortment", systemImage: "magnifyingglass")
                }
        }
        .onAppear() {
            viewModel.viewAppeared()
        }
        .environmentObject(viewModel)
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
