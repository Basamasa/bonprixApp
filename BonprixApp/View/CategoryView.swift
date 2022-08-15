//
//  ReusableView.swift
//  BonprixApp
//
//  Created by Anzer Arkin on 14.08.22.
//

import SwiftUI

struct CategoryView: View {
    var category: Category

    let imageSize: CGFloat = 150
    @State var scaleOffset = 1.0
    
    var body: some View {
        VStack {
            // Parent view
            if let categories = category.children {
                if let image = category.image {
                    ImageView(imageName: image, height: imageSize)
                        .scaleEffect(CGFloat(scaleOffset) + 1)
                }
                ScrollView {
                    ForEach(categories, id: \.self) { category in
                        CategoryDetailView(category: category)
                    }
                    .background(GeometryReader { proxy -> Color in
                        DispatchQueue.main.async {
                            let scaleLevel = proxy.frame(in: .named("scroll")).origin.y / 150
                            if scaleLevel >= 0 {
                                scaleOffset = scaleLevel
                            }
                        }
                        return Color.clear
                    })
                }.coordinateSpace(name: "scroll")

            } else {
                // Child/Leaf view
                LeafView(category: category)
            }
        }
        .navigationTitle(category.label)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CategoryDetailView: View {
    var category: Category
    
    @ViewBuilder
    func imageCategory(image: String) -> some View {
        ZStack {
            ImageView(imageName: image)
            Text("\(category.label)")
                .multilineTextAlignment(.center)
                .padding()
                .background(Rectangle().fill(Color.white.opacity(0.6)).shadow(radius: 3))
                .offset(y: 60)
        }
    }
    
    var textCategory: some View {
        VStack {
            HStack {
                Text("\(category.label)")
                Spacer()
                if category.children != nil {
                    Image(systemName: "chevron.right")
                }
            }
            Divider()
        }
        .padding([.horizontal])
    }
    
    var body: some View {
        NavigationLink(destination: CategoryView(category: category)) {
            if let image = category.image {
                imageCategory(image: image)
            } else {
                textCategory
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
