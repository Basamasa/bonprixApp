//
//  LoadingView.swift
//  BonprixApp
//
//  Created by Anzer Arkin on 14.08.22.
//

import SwiftUI

struct LoadingView<Content>: View where Content: View {
    @Binding var isShowing: Bool
    var content: () -> Content
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                self.content()
                    .disabled(self.isShowing)
                
                VStack {
                    ProgressView()
                }
                .opacity(self.isShowing ? 1 : 0)   
            }
        }
    }
}
