//
//  ContentView.swift
//  TripleTeaser
//
//  Created by Andrew Micenko on 11/11/2025.
//

import SwiftUI

@frozen
public enum Decision: CaseIterable {
    case rock, paper, scissors

    func format() -> String {
        switch self {
        case .rock: return "🪨"
        case .paper: return "📜"
        case .scissors: return "✂️"
        }
    }
}

struct ContentView: View {
    @State var computerDecision: Decision = Decision.allCases.randomElement()!
    @State var shouldPlayerWin = Bool.random()
    @State var isGameOver = false
    @State var playerChoice: Decision = .rock
    @State var score = 0

    @Namespace private var namespace

    @Environment(\.displayScale) var displayScale

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RadialGradient(
                    stops: [
                        .init(color: .green, location: 0.0),
                        .init(color: .green, location: 0.3),
                        .init(color: .yellow, location: 0.3),
                        .init(color: .clear, location: 1.0),
                    ],
                    center: .init(x: 0.5, y: -0.05),
                    startRadius: 0,
                    endRadius: ((geometry.size.width * displayScale) / 2)  //+ 80
                ).ignoresSafeArea()

                VStack {
                    Spacer()

                    Text("I Play").font(.largeTitle)
                    Text(computerDecision.format())
                        .font(.system(size: 100))
                        .padding(20)
                        .glassEffect(in: .rect(cornerRadius: 10))
                    //.withBackgroundEffect()

                    Spacer()
                    Spacer()

                    Text(
                        "You need to **\(shouldPlayerWin ? "win" : "lose")**!"
                    ).font(.title)
                    GlassEffectContainer {
                        HStack {
                            Spacer()
                            ForEach(Decision.allCases.indices, id: \.self) {
                                index in

                                Button(Decision.allCases[index].format()) {
                                    choose(index)
                                }
                                .font(.system(size: 60))
                                .padding(20)
                                .glassEffect()
                                .glassEffectUnion(
                                    id: 1,
                                    namespace: namespace
                                )
                                Spacer()
                            }
                        }
                        //                            Picker("Choose", selection: $playerChoice) {
                        //                                ForEach(Decision.allCases, id: \.self) {
                        //                                    Text($0.format()).font(.largeTitle)
                        //                                }
                        //                            }
                        //                            .pickerStyle(.segmented)
                        //                            .glassEffect()
                    }
                    Text("Score: **\(score)**").font(.title)
                    //                    Text(
                    //                        "Dimensions: (\(geometry.size.width.formatted()), \(geometry.size.height.formatted()))"
                    //                    )
                    //                    Text("Corner Insets: \(geometry.containerCornerInsets)")
                    //                    Text("Safe Area Insets: \(geometry.safeAreaInsets)")

                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.ultraThinMaterial)
                //.background(.thinMaterial)
                .alert("Game Over", isPresented: $isGameOver) {
                    Button("Start Again") {
                        // Restart the game
                        score = 0
                        startNextRound()
                    }
                } message: {
                    Text("Your final score was \(score) points.").font(.headline)
                }
            }

        }
    }
    
    func choose(_ index: Int) {
        let computerDecisionIndex = Decision.allCases.firstIndex(of: computerDecision)!
        let requiredPlayerIndex: Int
        if (shouldPlayerWin) {
            requiredPlayerIndex = (computerDecisionIndex + 1) % Decision.allCases.count
        } else {
            requiredPlayerIndex = (computerDecisionIndex + 2) % Decision.allCases.count
        }
        
        if (requiredPlayerIndex == index) {
            score += 1
            startNextRound()
        }
        else {
            isGameOver = true
        }
    }
    
    func startNextRound() {
        computerDecision = Decision.allCases.randomElement()!
        shouldPlayerWin = Bool.random()
    }
}

#Preview {
    ContentView()
}
