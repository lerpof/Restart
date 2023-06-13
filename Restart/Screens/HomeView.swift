//
//  HomeView.swift
//  Restart
//
//  Created by Leonardo Lazzari on 05/04/23.
//

import SwiftUI

struct HomeView: View {
    // MARK: - PROPERTY
    @AppStorage("onboarding") var isOnboardinViewActive = false
    @State private var isAnimating: Bool = false
    
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 20) {
            // MARK: - HEADER
            Spacer()
            
            ZStack {
                CircleGroupView(shapeColor: .gray, shapeOpacity: 0.1)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(
                        .easeInOut(duration: 4).repeatForever(),
                        value: isAnimating
                    )
                    .task {
                        try? await Task.sleep(nanoseconds: 500_000_000)
                        isAnimating = true
                    }
            }
            
            // MARK: - CENTER
            Text("The time that leads to mastery is dependent on the intensity of our focus.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            // MARK: - FOOTER
            Spacer()
            
            Button {
                withAnimation {
                    playSound(sound: "success", type: "m4a")
                    isOnboardinViewActive = true
                }
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            } //: BUTTON
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        } //: VSTACK
//        .onAppear {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
//                isAnimating = true
//            })
//        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
