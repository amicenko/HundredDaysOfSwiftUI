//
//  ContentView.swift
//  WeSplitLearning
//
//  Created by Andrew Micenko on 5/11/2025.
//

import SwiftUI

fileprivate let defaultTeam = "Scorchers"

struct FirstContentView: View {
    let cricketTeams = [defaultTeam, "Stars", "Hurricanes", "Sixers", "Thunder", "Strikers", "Heat", "Renegades"].sorted()
    
    @State private var pressCount = 0
    @State private var name = ""
    @State private var favoriteTeam = defaultTeam
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Favourite cricket team", selection: $favoriteTeam) {
                        ForEach(cricketTeams, id: \String.self) {
                            Text($0)
                        }
                    }
                    
                    Text("I'm in section 1")
                    Text("I'm in section 1")
                    Text("I'm in section 1")
                    
                    Button("Press Count: \(pressCount)") {
                        self.pressCount += 1
                    }
                    .keyboardShortcut(KeyboardShortcut("B", modifiers: EventModifiers.command))
                }
                
                Section {
                    Text("I'm in section 2")
                    Text("I'm in section 2")
                    Text("I'm in section 2")
                    Text("I'm in section 2")
                    Text("I'm in section 2")
                }
                
                TextField("What's your name?", text: $name)
                Text("Hello, \(name.isEmpty ? "World" : name)!")
                Text("Hello, \(name.isEmpty ? "World" : name)!")
                Text("Hello, \(name.isEmpty ? "World" : name)!")
            }
            .navigationTitle("Our WeSplit")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    FirstContentView()
}
