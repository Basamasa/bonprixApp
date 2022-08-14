//
//  ImageView.swift
//  BonprixApp
//
//  Created by Anzer Arkin on 14.08.22.
//

import SwiftUI

struct ImageView: View {
    var imageName: String
    var height: CGFloat = 200
    
    var body: some View {
        AsyncImage(url: URL(string: imageName)) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(height: height)
            case .success(let image):
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: height)
            case .failure:
                Image(systemName: "photo")
            @unknown default:
                EmptyView()
            }
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(imageName: "https://image01.bonprix.de/bonprixbilder/teaser/app/channels/app-dez-19a.jpg")
    }
}
