//
//  CircleGroupView.swift
//  SwiftUI-SecondApp
//
//  Created by Ashish Barve on 02/10/22.
//

import SwiftUI

struct CircleGroupView: View {
    
    @State var shapeColor: Color
    @State var shapeOpacity: Double
    
    private let frameWidhtHeight: CGFloat = 260
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(shapeColor.opacity(shapeOpacity), lineWidth: 40)
                .frame(width: frameWidhtHeight, height: frameWidhtHeight, alignment: .center)
            Circle()
                .stroke(shapeColor.opacity(shapeOpacity), lineWidth: 80)
                .frame(width: frameWidhtHeight, height: frameWidhtHeight, alignment: .center)
        }
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            CircleGroupView(shapeColor: .white, shapeOpacity: 0.2)
        }
    }
}
