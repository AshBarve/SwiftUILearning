//
//  InfoPanelView.swift
//  SwiftUI-ThirdApp
//
//  Created by Ashish Barve on 04/10/22.
//

import SwiftUI

struct InfoPanelView: View {
    
    var offset: CGSize
    var scale: CGFloat
    
    @State private var isInfoPanelVisible: Bool = false
    
    var body: some View {
        
        HStack {
            Image(systemName: "circle.circle")
                .symbolRenderingMode(.hierarchical)
                .resizable()
                .frame(width: 30, height: 30)
                .onLongPressGesture(minimumDuration: 1) {
                    withAnimation(.easeOut) {
                        isInfoPanelVisible.toggle()
                    }
                }
            
            HStack {
                Image(systemName: "arrow.up.left.and.arrow.down.right")
                Text(scale.description)
                Spacer()
                
                Image(systemName: "arrow.up.and.down")
                Text(offset.height.roundToTwo().description)
                Spacer()
                
                Image(systemName: "arrow.left.and.right")
                Text(offset.width.roundToTwo().description)
            }
            .font(.footnote)
            .padding(8)
            .background(.ultraThinMaterial)
            .cornerRadius(8)
            .frame(maxWidth: 250)
            .opacity(isInfoPanelVisible ? 1 : 0)
        }
        .frame(alignment: .leading)
    }
}

struct InfoPanelView_Previews: PreviewProvider {
    static var previews: some View {
        InfoPanelView(offset: .zero, scale: 1)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

extension CGFloat {
    
    func roundToTwo() -> Double {
        return (floor(self * 100) / 100.0)
    }
}
