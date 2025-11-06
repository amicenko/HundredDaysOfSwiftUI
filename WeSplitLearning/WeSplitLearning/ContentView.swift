//
//  ContentView.swift
//  WeSplitLearning
//
//  Created by Andrew Micenko on 5/11/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Form {
            Section {
                Text("I'm in section 1")
            }
            
            Section {
                Text("I'm section 2")
            }
            
            Text("Hello, world!")
            Text("Hello, world!")
            Text("Hello, world!")
        }
    }
}

#Preview {
    ContentView()
}
