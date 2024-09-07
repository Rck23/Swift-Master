//
//  CirculoGrupView.swift
//  Restart
//
//  Created by Ulises Martínez on 23/07/24.
//

import SwiftUI

struct CirculoGrupView: View {
    
    @State var ShapeColor: Color
    @State var ShapeOpacidad: Double
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacidad), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacidad), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        }//: ZSTACK
        .blur(radius: isAnimating ?0:10)
        .opacity(isAnimating ?1:0)
        .scaleEffect(isAnimating ? 1 :0.5)
        .animation(.easeOut(duration: 1), value: isAnimating)
        .onAppear(perform: {
            isAnimating = true
        })
    }
}

#Preview {
    ZStack {
        Color("ColorAzul")
            .ignoresSafeArea()
        CirculoGrupView(ShapeColor: .white, ShapeOpacidad: 0.2)
    }
}
