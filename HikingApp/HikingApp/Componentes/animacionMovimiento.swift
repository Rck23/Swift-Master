//
//  animacionMovimiento.swift
//  HikingApp
//
//  Created by Ulises Martínez on 17/07/24.
//

import SwiftUI

// Definición de la estructura animacionMovimiento que hereda de View, permitiendo su uso como interfaz de usuario
struct animacionMovimiento: View {
    /// MARK - PROPIEDADES
    @State private var randomCirculo : Int = Int.random(in: 6...15) // Estado para determinar el número aleatorio de círculos
    @State private var esAnimado : Bool = false // Estado para controlar si los círculos están en movimiento o no
    
    /// MARK - FUNCIONES
    
    /// 1. RANDOM COORDINACION
    // Función para generar una coordenada aleatoria dentro de un rango especificado
    func randomCoord () -> CGFloat {
        return CGFloat.random(in: 0 ... 256)
    }
    
    /// 2. RANDOM TAMAÑO
    // Función para generar un tamaño aleatorio para los círculos
    func randomTamaño() -> CGFloat {
        return CGFloat(Int.random(in: 4 ... 80))
    }
    
    /// 3. RANDOM ESCALA
    // Función para generar un factor de escala aleatorio para los círculos
    func randomEscala() -> CGFloat {
        return CGFloat(Double.random(in: 0.1 ... 2.0))
    }
    
    /// 4. RANDOM VELOCIDAD
    // Función para generar una velocidad aleatoria para la animación de los círculos
    func randomVelocidad() -> Double {
        return Double.random(in: 0.05 ... 1.0)
    }
    
    /// 5. RANDOM DELAY
    // Función para generar un retraso aleatorio antes de iniciar la animación de los círculos
    func randomDelay() -> Double {
        return Double.random(in: 0 ... 2.0)
    }
    
    var body: some View {
        ZStack{
            // Bucle para crear un número aleatorio de círculos con propiedades y animaciones aleatorias
            ForEach(0...randomCirculo, id: \.self) { circulo in
                Circle()
                    .foregroundColor(.white)
                    .opacity(0.25)
                    .frame(width: randomTamaño())
                    .position(
                        x: randomCoord(),
                        y: randomCoord()
                    )
                    .scaleEffect(esAnimado ? randomEscala() : 1)
                    .onAppear ( perform:{
                        // Animación que se aplica al aparecer cada círculo
                        withAnimation(.interpolatingSpring(stiffness: 0.25, damping: 0.25)
                            .repeatForever()
                            .speed(randomVelocidad())
                            .delay(randomDelay())
                        ) {
                            esAnimado = true // Activa la animación de escala para cada círculo
                        }
                    })
                
            }
        }
        .frame(width: 256, height: 256) // Establece el tamaño del contenedor de los círculos
        .mask(Circle()) // Aplica una máscara circular para redondear los bordes del contenedor
        .drawingGroup() // Optimiza el rendimiento al tratar el contenido como una sola imagen renderizada
    }
}

#Preview {
    
        animacionMovimiento()
    
}
