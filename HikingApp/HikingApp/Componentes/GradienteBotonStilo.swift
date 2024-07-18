//
//  GradienteBotonStilo.swift
//  HikingApp
//
//  Created by Ulises Martínez on 15/07/24.
//

import Foundation
import SwiftUI

// Definición de la estructura GradienteBoton que implementa el protocolo ButtonStyle
struct GradienteBoton : ButtonStyle {
    
    // Implementación del método makeBody requerido por el protocolo ButtonStyle
    func makeBody(configuration: Configuration) -> some View {
        // Uso de la configuración proporcionada para acceder al label del botón
        configuration
            .label
            // Añade padding vertical para dar espacio arriba y abajo del contenido del botón
            .padding(.vertical)
            // Añade padding horizontal específico para dar espacio a los lados del contenido del botón
            .padding(.horizontal, 30)
            // Establece el fondo del botón con un gradiente lineal
            .background(
                // Utiliza una condición ternaria para cambiar el gradiente dependiendo de si el botón está presionado o no
                configuration.isPressed ?
                // Si el botón está presionado, se usa un gradiente de colores oscuros a claros de arriba a abajo
                LinearGradient(colors: [.customGrisMedium, .customGrisLight], startPoint: .top, endPoint: .bottom)
                :
                // Si el botón no está presionado, se usa un gradiente de colores claros a oscuros de arriba a abajo
                LinearGradient(colors: [.customGrisLight, .customGrisMedium], startPoint: .top, endPoint: .bottom)
            )
            // Aplica un borde redondeado al botón para suavizar las esquinas
            .cornerRadius(40)
    }
}
