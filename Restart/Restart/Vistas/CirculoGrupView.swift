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
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacidad), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacidad), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        }//: ZSTACK
    }
}

#Preview {
    ZStack {
        Color("ColorAzul")
            .ignoresSafeArea()
        CirculoGrupView(ShapeColor: .white, ShapeOpacidad: 0.2)
    }
}
