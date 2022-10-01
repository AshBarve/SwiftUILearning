//
//  ContentView.swift
//  SwiftUI-FirstApp
//
//  Created by Ashish Barve on 01/10/22.
//

import SwiftUI


extension Image {
    func imageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    
    func iconModifier() -> some View {
        self
            .imageModifier()
            .frame(maxWidth: 150)
            .foregroundColor(.purple)
            .opacity(0.6)
    }
}

struct ContentView: View {
    
    private let imageURL = "https://images.unsplash.com/photo-1608991156162-3c55b3cf05d3"
    
    var body: some View {
        // MARK: - 1. BASIC
//         AsyncImage(url: URL(string: imageURL))
        
        // MARK: - 2. SCALE
//         AsyncImage(url: URL(string: imageURL), scale: 9.0)
        
        // MARK: - 3 PLACEHOLDER
//        AsyncImage(url: URL(string: imageURL)) { image in
//            image.imageModifier()
//        } placeholder: {
//            Image(systemName: "photo.circle.fill").iconModifier()
//        }
//        .padding(50)
        
        // MARK: - 4. PHASE
//        AsyncImage(url: URL(string: imageURL)) { phase in
//            // SUCCESS
//            // FAILURE
//            // EMPTY
//            if let image = phase.image {
//                image.imageModifier()
//            } else if phase.error != nil {
//                Image(systemName: "ant.circle.fill").iconModifier()
//            } else {
//                Image(systemName: "photo.circle.fill").iconModifier()
//            }
//        }
//        .padding(50)

        // MARK: - 5. ANIMATION
        AsyncImage(url: URL(string: imageURL), transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))) { phase in
            switch phase {
            case .success(let image):
                image.imageModifier()
//                    .transition(.move(edge: .bottom))
                    .transition(.scale)
            case .failure(_):
                Image(systemName: "ant.circle.fill").iconModifier()
            case .empty:
                Image(systemName: "photo.circle.fill").iconModifier()
            @unknown default:
                ProgressView()
            }
        }
        .padding(50)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
