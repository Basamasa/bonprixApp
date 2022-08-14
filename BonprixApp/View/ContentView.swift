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
            ShopView(viewModel: viewModel.shopViewModel)
                .tabItem {
                    Label("Shop", systemImage: "tray.and.arrow.down.fill")
                }
            NavigationView {
                    ReusableView(title: "Assortment", categories: viewModel.categories)
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
