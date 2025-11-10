//
//  FlagView.swift
//  GuessTheFlagLearning
//
//  Created by Andrew Micenko on 10/11/2025.
//

import SwiftUI

private var countries = [
    "Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria",
    "Poland", "Spain", "UK", "Ukraine", "USA",
].shuffled()

struct FlagViewEndDay21: View {
    @State var currentCorrectAnswer = Int.random(in: 0..<4)

    @State private var isScoreShowing = false
    @State private var scoreTitle = ""
    @State private var scoreMessage = ""
    @State private var score = 0

    var body: some View {
        ZStack {
            RadialGradient(
                stops: [
                    .init(color: .green, location: 0.3),
                    .init(color: .yellow, location: 0.3),
                ],
                center: .top,
                startRadius: 200,
                endRadius: 700
            ).ignoresSafeArea()

            VStack {
                Spacer()

                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)

                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of").padding(15).font(
                            .subheadline.weight(.heavy)
                        ).foregroundStyle(.secondary)
                        Text(countries[currentCorrectAnswer]).padding()
                            .foregroundStyle(
                                .selection
                            ).font(.largeTitle.weight(.semibold))

                    }.background(.thinMaterial)
                        .cornerRadius(20)

                    ForEach(0..<4, id: \.self) { number in
                        Button {
                            onFlagTapped(number)
                        } label: {
                            Image("Flags/\(countries[number])").clipShape(
                                .capsule
                            )
                        }.shadow(radius: 7)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.thinMaterial)
                .clipShape(.rect(cornerRadius: 20))

                Spacer()
                Spacer()

                Text("Score: \(score)")
                    .font(.title.bold())

                Spacer()
            }
            .padding()
            .alert(scoreTitle, isPresented: $isScoreShowing) {
                Button("Continue", action: askQuestion)
            } message: {
                Text(scoreMessage)
            }
        }
    }

    func onFlagTapped(_ number: Int) {
        if number == currentCorrectAnswer {
            scoreTitle = "Correct"
            score += 1
            scoreMessage = "Your score is \(score)."
        } else {
            scoreTitle = "Incorrect"
            scoreMessage =
                "You chose \(countries[number]). The correct flag was number \(currentCorrectAnswer + 1).\nYour final score was \(score)."
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
    FlagViewEndDay21()
}
