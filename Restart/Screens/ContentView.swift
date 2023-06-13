//
//  ContentView.swift
//  Restart
//
//  Created by Leonardo Lazzari on 05/04/23.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("onboarding") var isOnboardingViewActive = true
    
    var body: some View {
        ZStack {
            if isOnboardingViewActive {
                OnboardingView()
            } else {
                HomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
