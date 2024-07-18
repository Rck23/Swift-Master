//
//  TarjetaView.swift
//  HikingApp
//
//  Created by Ulises Martínez on 15/07/24.
//

import SwiftUI

struct TarjetaView: View {
    // MARK - PROPIEDADES
    // Propiedad de estado para controlar el número de la imagen mostrada actualmente
       @State private var numImagen = 1
       // Propiedad de estado para generar un número aleatorio para cambiar la imagen
       @State private var numRandom = 1
       
       // Propiedad de estado para controlar si se muestra o no una vista modal
       @State private var abrirModal: Bool = false
       
       // MARK - FUNCIONES
       // Función para generar un número aleatorio y cambiar la imagen mostrada
    func randomImagen() {
        print(" --- BOTÓN PRESIONADO ---")
        print("Resultado: Antiguo numero de imagen = \(numImagen)")
        repeat{
            numRandom = Int.random(in: 1...5)
            print("Resultado: Numero random = \(numRandom)")
        }while numRandom == numImagen
                
        numImagen = numRandom
        
        print("Resultado: Nuevo numero de imagen = \(numImagen)")
        print(" --- FIN ---")
        print("\n")

    }

    var body: some View {
        // MARK - CARD
        // Uso de ZStack para superponer elementos visualmente
        ZStack {
            CustomBackgroundView() // Componente personalizado para el fondo
            
            VStack {// Organización vertical de los elementos
                // MARK: - HEADER
                // Sección del encabezado con título y botón para abrir una vista modal
                VStack(alignment: .leading) {
                    HStack {
                        Text("Senderismo")
                            .fontWeight(.black)
                            .font(.system(size: 30))
                            .foregroundStyle(LinearGradient(colors: [.customGrisLight, .customGrisMedium], startPoint: .top, endPoint: .bottom))
                        
                        Spacer()
                        
                        Button(action: {
                            abrirModal.toggle() // Acción del botón para abrir la vista modal
                        }, label: {
                            CustomBotonView() // Componente personalizado para el botón
                        }).sheet(isPresented: $abrirModal) {
                            ConfigView() // Contenido de la vista modal
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
                        }
                    }
                    
                    Text("Actividad divertida en la naturaleza para toda la familia.")
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        .italic()
                        .foregroundColor(.customGrisMedium)
                    
                }//: - HEADER
                .padding(.horizontal, 30)
                
                // MARK: - CONTENIDO PRINCIPAL
                // Sección principal con una imagen que cambia aleatoriamente
                ZStack {
                    customCirculoView() // Vista personalizada para el fondo circular
                                    
                    Image("image-\(numImagen)") // Imagen que cambia según numImagen
                        .resizable()
                        .scaledToFit()
                        .animation(.easeOut(duration: 1), value: numImagen) // Animación al cambiar la imagen
                    }
                
                // MARK: - FOOTER
                // Botón para cambiar la imagen mostrada
                Button{
                    randomImagen() // Acción del botón para cambiar la imagen
                } label: {
                    Text("Explorar más")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(LinearGradient(colors: [.customVerdeLight, .customVerdeMedium], startPoint: .top, endPoint: .bottom))
                        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.30), radius: 0.25, x: 1, y: 2)
                }
                .buttonStyle(GradienteBoton()) // Estilo personalizado para el botón
            }//:VStack
        } //: CARD
        .frame(width: 320, height: 570) // Tamaño de la tarjeta
    }
}

#Preview {
    TarjetaView()
}
