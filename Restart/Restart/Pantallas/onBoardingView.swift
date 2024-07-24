//
//  onBoardingView.swift
//  Restart
//
//  Created by Ulises Martínez on 23/07/24.
//

import SwiftUI

struct onBoardingView: View {
    // MARK: - PROPIEDADES
    @AppStorage("onboarding") var esActivaOnboardingView: Bool = true

    // MARK: - BODY
    var body: some View {
        ZStack {
            Color("ColorAzul")
                .ignoresSafeArea()
            
            VStack (spacing: 20){
                // MARK: - HEADER
                Spacer()
                
                VStack(spacing:0){
                    Text("Share.")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    
                    Text("""
                        It's not how much we give but how much love we put into giving.
                        """)
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                }//: HEADER
                
                // MARK: - BODY
                ZStack{
                    
                    CirculoGrupView(ShapeColor: .white, ShapeOpacidad: 0.2)
                    
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                }//: CENTER
                
                Spacer()
                
                // MARK: - FOOTER
                
                ZStack{
                    // Botón custom
                    // 1. BACKGROUND
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                    
                    // 2. LLAMAR LA ACCION
                    Text("Empezar")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x: 20)
                    // 3. CAPSULAR (TAMAÑO DINAMICO)
                    HStack{
                        Capsule()
                            .fill(Color("ColorRojo"))
                            .frame(width: 80)
                        
                        Spacer()
                    }
                    
                    // 4. CIRCULO (DREGGABLE)
                    HStack {
                        ZStack{
                            
                            Circle()
                                .fill(Color("ColorRojo"))
                            
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(8)
                            
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                        }
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80, alignment: .center)
                        .onTapGesture {
                            esActivaOnboardingView = false
                        }
                        
                        Spacer()
                    }//: HSTACK
                    
                }//:FOOTER
                .frame(height: 80, alignment: .center)
                .padding()
                
            }//: VStack
        }//: ZStack
    }
}

#Preview {
    onBoardingView()
}
