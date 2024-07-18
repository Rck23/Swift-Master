//
//  LabeledContentCustom.swift
//  HikingApp
//
//  Created by Ulises Martínez on 18/07/24.
//

import SwiftUI

// Definición de la estructura LabeledContentCustom que hereda de View, permitiendo su uso como interfaz de usuario
struct LabeledContentCustom: View {
    
    // MARK: PROPIEDADES
    @State var rowLabel: String // Título del elemento
    @State var rowIcono: String // Icono del elemento
    @State var rowContenido: String? = nil // Contenido opcional del elemento
    @State var rowColor: Color // Color del icono
    
    @State var Linklabel: String? = nil // Título opcional del enlace
    @State var Linkdestino: String? = nil // Destino opcional del enlace
     
    var body: some View {

        LabeledContent{
            // Contenido
            // Verifica si hay contenido para mostrar; si no, verifica si hay un enlace para mostrar; si no, muestra una vista vacía
            if rowContenido != nil {
                Text(rowContenido!)
                    .foregroundColor(.primary)
                .fontWeight(.heavy)
                
            } else if (Linklabel != nil && Linkdestino != nil ) {
                
                Link(Linklabel!, destination: URL(string: Linkdestino!)!)
                    .foregroundColor(.pink)
                    .fontWeight(.heavy)
                
            } else {
                EmptyView() // Vista vacía si no hay contenido ni enlace
            }
        } label: {
              // Etiqueta
              HStack{
                  ZStack{
                      RoundedRectangle(cornerRadius: 8)
                          .frame(width: 30, height: 30)
                          .foregroundColor(rowColor) // Color de fondo del icono
                      Image(systemName: rowIcono)
                          .foregroundColor(.white) // Color del icono
                          .fontWeight(.semibold) // Peso de la fuente del icono
                  }
                  Text(rowLabel) // Título del elemento
              }
          }
      }
  }

// Vista previa para el entorno de desarrollo de Xcode
#Preview {
    List() {
        LabeledContentCustom(rowLabel: "Sitio web", rowIcono: "globe", rowContenido: nil, rowColor: .pink, Linklabel: "Github", Linkdestino: "https://github.com/Rck23")
    }
}
