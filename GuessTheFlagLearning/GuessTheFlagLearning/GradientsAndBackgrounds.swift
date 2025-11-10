//
//  ContentView.swift
//  GuessTheFlagLearning
//
//  Created by Andrew Micenko on 10/11/2025.
//

import SwiftUI

struct GradientsAndBackgrounds: View {
    var body: some View {
        ZStack {
            Color.primary.opacity(0.25)

            // Shift-Command-A flips light/dark mode in simulator
            VStack(spacing: 0) {
                Color.green
                Color.yellow
            }

            //            LinearGradient(
            //                stops: [
            //                    Gradient.Stop(color: .yellow, location: 0.35),
            //                    .init(color: .green, location: 0.65),
            //                ],
            //                startPoint: .topLeading,
            //                endPoint: .bottomTrailing
            //            )

            //            RadialGradient(colors: [.cyan, .mint], center: .center, startRadius: 20, endRadius: 180)

            //            AngularGradient(
            //                colors: [.red, .yellow, .green, .blue, .purple, .red],
            //                center: .init(x: 0.25, y: 1.0 / 3)
            //            )

            // Color.orange.frame(minWidth: 200, maxWidth: 300, maxHeight: 200)

            Text("This was funny").frame(
                minWidth: 200,
                maxWidth: 300,
                maxHeight: 200,
                alignment: .top
            )
            .background(.indigo.gradient)
            .cornerRadius(10)

            Text("Hi Everybody!")
                .foregroundStyle(.secondary)
                .padding(50)
                .background(.ultraThinMaterial)
                //.background(.red.gradient // Subtle OS-controlled gradient
                .cornerRadius(20)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    GradientsAndBackgrounds()
}
