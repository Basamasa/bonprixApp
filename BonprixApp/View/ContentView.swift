//
//  ContentView.swift
//  BonprixApp
//
//  Created by Anzer Arkin on 13.08.22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContenViewModel()
    @State var text: String = ""
    
    var shopView: some View {
        NavigationView {
            LeafView(viewModel: LeafViewModel(category: viewModel.shopCategory))
                .searchable(text: $text, placement: .navigationBarDrawer(displayMode: .always), prompt: "Suchen")
        }
        .tabItem {
            Label("Shop", systemImage: "tray.and.arrow.down.fill")
        }
    }
    
    var assortmentView: some View {
        NavigationView {
            CategoryView(category: Category(label: "Assortment", url: nil, image: nil, children: viewModel.assortmentCategories))
                .searchable(text: $text, placement: .navigationBarDrawer(displayMode: .always), prompt: "Suchen")
        }
        .tabItem {
            Label("Assortment", systemImage: "magnifyingglass")
        }
    }
    
    var body: some View {
        TabView {
            shopView
            assortmentView
        }
        .onAppear() {
            viewModel.viewAppeared()
        }
        .alert(viewModel.errorMessage, isPresented: $viewModel.isErrorShown) {
            Button("OK", role: .cancel) { }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
