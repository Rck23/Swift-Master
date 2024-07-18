//
//  customCirculoView.swift
//  HikingApp
//
//  Created by Ulises Martínez on 17/07/24.
//

import SwiftUI

// Definición de la estructura customCirculoView que hereda de View, permitiendo su uso como interfaz de usuario
struct customCirculoView: View {
    
    // Estado privado para controlar la animación del gradiente
    @State private var esAnimadoGradiente: Bool = false
    
    var body: some View {
        // Uso de ZStack para superponer elementos visualmente
        ZStack {
            // Círculo con un gradiente que cambia su dirección basado en el estado de esAnimadoGradiente
            Circle()
                .fill(
                    .linearGradient(colors: [.customIndigoMedium, .customSalmon], startPoint: esAnimadoGradiente ? .topLeading : .bottomLeading, endPoint: esAnimadoGradiente ? .bottomTrailing : .topTrailing)
                )
                // Acción al aparecer la vista para iniciar la animación del gradiente
                .onAppear{
                    withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)){
                        esAnimadoGradiente.toggle()
                    }
            }
            
            // Llamada a una función que crea otra animación (no definida en este fragmento de código)
            animacionMovimiento()
        } // Fin de ZStack
        .frame(width: 256, height: 256) // Establece el tamaño del círculo
    }
}

#Preview {
    customCirculoView()
}
