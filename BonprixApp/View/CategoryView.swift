//
//  ReusableView.swift
//  BonprixApp
//
//  Created by Anzer Arkin on 14.08.22.
//

import SwiftUI

struct CategoryView: View {
    var category: Category
    @State var offset = 1.0 {
        didSet {
            print(offset)
        }
    }
    
    var body: some View {
        VStack {
            if let categories = category.children {
                if let image = category.image {
                    ImageView(imageName: image, height: 100)
                        .scaleEffect(CGFloat(offset) + 1)
                }
                ScrollView {
                    ForEach(categories, id: \.self) { category in
                        ResuableNavigationView(category: category)
                    }
                    .background(GeometryReader { proxy -> Color in
                        DispatchQueue.main.async {
                            offset = proxy.frame(in: .named("scroll")).origin.y/100
                        }
                        return Color.clear
                    })
                }.coordinateSpace(name: "scroll")

            } else {
                LeafView(viewModel: LeafViewModel(category: category))
            }
        }
        .navigationTitle(category.label)
    }
}

struct ResuableNavigationView: View {
    var category: Category
    
    @ViewBuilder
    func imageItem(image: String) -> some View {
        ZStack {
            ImageView(imageName: image)
            Text("\(category.label)")
                .multilineTextAlignment(.center)
                .padding()
                .background(Rectangle().fill(Color.white.opacity(0.6)).shadow(radius: 3))
                .offset(y: 60)
        }
    }
    
    var textItem: some View {
        VStack {
            HStack {
                Text("\(category.label)")
                Spacer()
            }
            Divider()
        }
        .padding([.horizontal])
    }
    
    var body: some View {
        NavigationLink(destination: CategoryView(category: category)) {
            if let image = category.image {
                imageItem(image: image)
            } else {
                textItem
                    .contentShape(Rectangle())
            }
        }
        .buttonStyle(.plain)
    }
}
struct ReusableView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(category: Category(label: "Reusable view", url: nil, image: nil, children: nil))
    }
}
