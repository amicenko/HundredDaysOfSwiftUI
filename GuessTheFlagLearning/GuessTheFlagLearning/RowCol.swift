//
//  FixedGrid.swift
//  GuessTheFlagLearning
//
//  Created by Andrew Micenko on 11/11/2025.
//

import SwiftUI

// It's not actually a grid, since it doesn't line up column edges
struct RowCol<Content: View>: View {
    let rows: Int
    let columns: Int
    
    let content: (Int, Int) -> Content

    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { col in
                        Image(systemName: "\(row * rows + col + 1).circle.fill")
                        content(row, col)
                    }
                }
            }
        }
    }
}

#Preview {
    RowCol<Text>(rows: 3, columns: 3) { row, col in
        Text("Row \(row + 1), Col \(col + 1)")
    }
}
