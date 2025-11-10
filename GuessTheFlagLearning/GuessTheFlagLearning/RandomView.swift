//
//  ContentView.swift
//  GuessTheFlagLearning
//
//  Created by Andrew Micenko on 10/11/2025.
//

import SwiftUI

struct RandomView: View {
    @State private var isShowingAlert = false

    var body: some View {
        VStack {

            VStack {
                Image(systemName: "globe").imageScale(.large).foregroundStyle(
                    .tint
                )
                Text("Uh oh!")
            }
            .padding()
            .alert("This is dangerous!", isPresented: $isShowingAlert) {
                Button("OK")
                { /*isShowingAlert = false Don't need this - alerts are automatically dismissed by any button*/
                }
                Button("Cancel", role: .cancel) {}
            } message: {
                Text("You have got to be kidding me!")
            }

            Button("Do it!", action: executeThing)
            Button("Do it again") {
                print("Doing it again")
                executeThing()
            }
            Button("Blow it up", role: .destructive, action: executeThing)
            Button("Show the alert") { isShowingAlert = true }.buttonStyle(
                .bordered
            )
            Button("Explosive bordered", role: .destructive) {}.buttonStyle(
                .bordered
            )
            Button("Definite prominent", role: .confirm) {}.buttonStyle(
                .glassProminent
            )
            Button("Tinted") {}
                .buttonStyle(.borderedProminent)
                .tint(Color.brown)

            Button("Hit me with it") {}
                .padding()
                .foregroundStyle(.regularMaterial)
                .background(.red)
                .cornerRadius(5)  // Will be completely square without this, since border style was not specified.

            Image("Germany")  // Needs to be in the asset catalog to work this way
            // Image(decorative: "Germany") // Screen reader will not read this out.

            Image(systemName: "macpro.gen1")

            Button("Mac Me", systemImage: "macpro.gen1.fill") {}

            Button {
                print("Doing it the hard way")
            } label: {
                HStack {
                    Image("Germany").resizable().scaledToFit().frame(
                        maxWidth: 50,
                        maxHeight: 40
                    )
                    Text("Mac me")
                }
            }

            Button {
                print("Doing it with a label")
            } label: {
                Label(
                    title: { Text("Using Label") },
                    icon: {
                        Image("Germany").resizable().scaledToFit().frame(
                            maxHeight: 40
                        ).padding(5)
                    }
                ).foregroundStyle(
                    .secondary
                )
            }.buttonStyle(.bordered)
        }
    }

    private func executeThing() {
        print("Doing the thing")
    }
}

#Preview {
    RandomView()
}
