//
//  HomeView.swift
//  Restart
//
//  Created by Ulises Martínez on 23/07/24.
//

import SwiftUI

struct HomeView: View {
    // MARK - PROPIEDADES
    @AppStorage("onboarding") var esActivaOnboardingView: Bool = false
    @State private var isAnimating: Bool = false

    // MARK - BODY
    var body: some View {
        VStack (spacing: 20){
            // MARK: - HEADER
            
            Spacer()
            
            ZStack {
               
                CirculoGrupView(ShapeColor: .gray, ShapeOpacidad: 0.1)

                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(
                        Animation
                            .easeOut(duration: 4)
                            .repeatForever()
                        , value: isAnimating
                    )
            }
            
            // MARK: - CENTER
            
            Text("El tiempo que conduce a la maestría depende de la intensidad de nuestro enfoque.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            // MARK: - FOOTER

            Spacer()
            
            Button(action: {
                withAnimation{
                    playSound(sound: "success", type: "m4a")

                    esActivaOnboardingView = true
                }
            }) {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
                
            }//:BUTTON
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
            
        }//:VSTACK
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7, execute:{ isAnimating = true })
            
        })
    }
}

#Preview {
    HomeView()
}
