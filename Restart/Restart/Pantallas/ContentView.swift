//
//  ContentView.swift
//  Restart
//
//  Created by Ulises Martínez on 23/07/24.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("onboarding") var esActivaOnboardingView: Bool = true
    
    var body: some View {
        ZStack {
            if esActivaOnboardingView {
                onBoardingView()
            } else {
                HomeView()
            }
        }
    }
}

#Preview {
    ContentView()
}
