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
    
    var body: some View {
        TabView {
            NavigationView {
                LeafView(viewModel: LeafViewModel(category: viewModel.shopCategory))
            }
            .tabItem {
                Label("Shop", systemImage: "tray.and.arrow.down.fill")
            }
            
            NavigationView {
                CategoryView(category: Category(label: "Assortment", url: nil, image: nil, children: viewModel.assortmentCategories))
                .searchable(text: $text, placement: .navigationBarDrawer(displayMode: .always), prompt: "Suchen")
            }
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
