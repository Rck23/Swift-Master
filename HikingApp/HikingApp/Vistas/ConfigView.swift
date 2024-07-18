//
//  ConfigView.swift
//  HikingApp
//
//  Created by Ulises Martínez on 17/07/24.
//

import SwiftUI

struct ConfigView: View {
    // MARK: PROPIEDADES
    // Propiedad privada que contiene los nombres de los iconos alternativos de la aplicación
    private let alternitavaAppIcono: [String] = [
        "AppIcon-Backpack",
        "AppIcon-Camera",
        "AppIcon-Campfire",
        "AppIcon-Mushroom"
    ]
    
    // El cuerpo de la vista, donde se define el contenido visible
    var body: some View {
        // Uso de List para crear una lista vertical de elementos
        List{
            // Sección: HEADER
            // Esta sección muestra un encabezado personalizado con texto e imágenes
            Section {
                // HStack para organizar horizontalmente los elementos
                HStack {
                    Spacer() // Espaciador para centrar el contenido
                    
                    // Imágenes y texto para el título y subtítulo
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 60, weight: .black))
                    
                    VStack (spacing: -10){ // VStack para organizar verticalmente el texto
                        Text("Excursión")
                            .font(.system(size: 39, weight: .black))
                            .padding(.bottom, 8)
                        
                        Text("Lectura")
                            .fontWeight(.medium)
                    }
                    
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 60, weight: .black))
                    Spacer()
                }//: HZTACK
                .foregroundStyle(LinearGradient(colors: [.customVerdeLight, .customVerdeMedium, .customVerdeDark], startPoint: .top, endPoint: .bottom))
                .padding(.top,8)
                
                // VStack para el texto descriptivo del encabezado
                VStack (spacing:10) {
                    
                    Text("¿Dónde se pueden encontrar \nexcursiones perfectas?")
                        .font(.title2)
                    .fontWeight(.heavy)
                    
                    Text("La ruta que parece preciosa en las fotos, pero que es aún mejor una vez que estás allí. La excursión que esperas volver a hacer algún día. \nEncuentra las mejores rutas de un día en la aplicación.")
                        .font(.footnote)
                        .italic()
                    
                    Text("¡Desempolva las botas! Es hora de dar un paseo.")
                        .fontWeight(.heavy)
                        .foregroundColor(.customVerdeMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
                
            }//: - HEADER
            .listRowSeparator(.hidden)
            
            // MARK: - SECCION: ICONOS
            // Esta sección permite al usuario seleccionar un icono alternativo para la aplicación
            Section(header: Text("Iconos alternativos")){
                ScrollView(.horizontal, showsIndicators: false) { // ScrollView horizontal para mostrar los iconos
                    HStack {
                        ForEach(alternitavaAppIcono.indices, id: \.self) { imagen in // Bucle para crear un botón por cada icono
                            Button{
                                UIApplication.shared.setAlternateIconName(alternitavaAppIcono[imagen]) { error in // Acción del botón para cambiar el icono de la app
                                    if error != nil {
                                        print("Error al actualizar el icono de la app. \(String(describing: error?.localizedDescription))")
                                    } else {
                                        print("Exito! Se ha cambiado el icono de la app a \(alternitavaAppIcono[imagen])")
                                    }
                                }
                            } label: {
                                Image("\(alternitavaAppIcono[imagen])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(16)
                            }
                            .buttonStyle(.borderless)
                        }
                    }
                }// :SCROLL VIEW
                .padding(.top, 13)
                Text("Elige tu icono de aplicación favorito de la colección.")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 13)
            }//: SECTION
            .listRowSeparator(.hidden)
            
            // MARK: - SECCION: ACERCA
            // Esta sección muestra información sobre la aplicación y enlaces relevantes
            Section(
                header: Text("Acerca de la app"),
                footer: HStack{
                        Spacer()
                        Text("Todos los derechos reservados ")
                        Spacer()
                    }
                    .padding(.vertical, 10)
                     
            ) {
                // 1. Labeled content basico
                
                // LabeledContent("Aplicación", value: "Hike")
                
                // 2. Labeled content avanzado
                // Contenido personalizado con iconos y texto descriptivo
                LabeledContentCustom(rowLabel: "Aplicación", rowIcono: "apps.iphone", rowContenido: "Hike", rowColor: .blue)
                
                LabeledContentCustom(rowLabel: "Compatibilidad", rowIcono: "info.circle", rowContenido: "iOS, iPad", rowColor: .red)
                
                LabeledContentCustom(rowLabel: "Aplicación", rowIcono: "apps.iphone", rowContenido: "Hike", rowColor: .blue)
                
                LabeledContentCustom(rowLabel: "Tecnología", rowIcono: "swift", rowContenido: "Swift", rowColor: .yellow)
               
                LabeledContentCustom(rowLabel: "Version", rowIcono: "gear", rowContenido: "1.0", rowColor: .indigo)
                
                LabeledContentCustom(rowLabel: "Desarrollador", rowIcono: "gear", rowContenido: "Sho", rowColor: .mint)
                
                LabeledContentCustom(rowLabel: "Diseñador", rowIcono: "paintpalette", rowContenido: "Tuntun", rowColor: .pink)
                
                LabeledContentCustom(rowLabel: "Sitio web", rowIcono: "globe", rowColor: .pink, Linklabel: "Github", Linkdestino: "https://github.com/Rck23")
                
            }//: SECTION
            
        }// : LIST
    }
}

#Preview {
    ConfigView()
}
