//
//  CustomBotonView.swift
//  HikingApp
//
//  Created by Ulises Martínez on 15/07/24.
//

import SwiftUI

// Definición de la estructura CustomBotonView que hereda de View, permitiendo su uso como interfaz de usuario
struct CustomBotonView: View {
    var body: some View {
        // Uso de ZStack para superponer elementos visualmente
        ZStack{
            // Primer círculo lleno con un gradiente verde
            Circle()
                .fill(
                    LinearGradient(colors: [.customVerdeLight, .customVerdeMedium], startPoint: .top, endPoint: .bottom)
                )
            
            // Segundo círculo con borde y un gradiente gris
            Circle()
                .stroke(LinearGradient(colors: [.customGrisLight, .customGrisMedium], startPoint: .top, endPoint: .bottom), lineWidth: 4)
            
            // Icono de figura caminando con un gradiente gris
            Image(systemName: "figure.hiking")
                .fontWeight(.black)
                .font(.system(size: 30))
                .foregroundStyle(LinearGradient(colors: [.customGrisLight, .customGrisMedium], startPoint: .top, endPoint: .bottom))
        }// Fin de ZStack
        .frame(width: 58, height: 58) // Tamaño del botón
    }
}

#Preview {
    CustomBotonView()
        .padding()
        .previewLayout(.sizeThatFits)
}
