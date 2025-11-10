//
//  FlagView.swift
//  GuessTheFlagLearning
//
//  Created by Andrew Micenko on 10/11/2025.
//

import SwiftUI

private var countries = [
    "Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "USA"
].shuffled()

struct FlagView: View {
    @State var currentCorrectAnswer = Int.random(in: 0..<countries.count)

    @State private var isScoreShowing = false
    @State private var scoreTitle = ""
    @State private var score = 0

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.green, .yellow],
                startPoint: .top,
                endPoint: .bottomTrailing
            ).ignoresSafeArea()

            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of").padding().font(
                        .subheadline.weight(.heavy)
                    )
                    Text(countries[currentCorrectAnswer]).padding()
                        .foregroundStyle(
                            .selection
                        ).font(.largeTitle.weight(.semibold))

                }.background(.thinMaterial)
                    .cornerRadius(20)

                ForEach(0..<4) { number in
                    Button {
                        onFlagTapped(number)
                    } label: {
                        Image("Flags/\(countries[number])").clipShape(
                            .capsule
                        )
                    }.shadow(radius: 7)
                }
            }
        }
        .alert(scoreTitle, isPresented: $isScoreShowing) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
    }

    func onFlagTapped(_ number: Int) {
        if number == currentCorrectAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Incorrect"
            score = 0
        }

        isScoreShowing = true
    }

    func askQuestion() {
        countries.shuffle()
        currentCorrectAnswer = Int.random(in: 0..<4)
    }
}

#Preview {
    FlagView()
}
