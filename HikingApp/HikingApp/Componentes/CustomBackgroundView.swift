//
//  CustomBackgroundView.swift
//  HikingApp
//
//  Created by Ulises Martínez on 15/07/24.
//

import SwiftUI

// Definición de la estructura CustomBackgroundView que hereda de View, permitiendo su uso como interfaz de usuario
struct CustomBackgroundView: View {
    var body: some View {
        // Uso de ZStack para superponer elementos visualmente
        ZStack {
            
            // MARK - 3. DEPTH
            // Capa de profundidad con color oscuro y desplazamiento hacia abajo
            Color.customVerdeDark
                .cornerRadius(40) // Bordes redondeados para suavizar el fondo
                .offset(y: 12) // Desplazamiento hacia abajo para crear un efecto de profundidad
            
            // MARK - 2. LIGHT
            // Capa intermedia con color claro y desplazamiento hacia abajo, con menor opacidad para suavizar el efecto
            Color.customVerdeLight
                .cornerRadius(40) // Bordes redondeados para mantener la coherencia visual
                .offset(y: 3) // Desplazamiento hacia abajo menor que la capa de profundidad
                .opacity(0.85) // Opacidad reducida para permitir que la luz se difumine
            
            // MARK - 1. SURFACE
            // Capa superior con un gradiente vertical de color verde claro a medio
            LinearGradient(colors: [Color.customVerdeLight, Color.customVerdeMedium], startPoint: .top, endPoint: .bottom)
                .cornerRadius(40) // Bordes redondeados para mantener la coherencia visual en todas las capas
        }
    }
}

#Preview {
    CustomBackgroundView()
        .padding()
}
