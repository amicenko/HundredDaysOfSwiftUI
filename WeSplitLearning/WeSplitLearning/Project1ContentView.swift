import SwiftUI

struct Project1ContentView: View {
    let predefinedTips = [0.0, 0.1, 0.15, 0.2, 0.25]

    @State private var billAmount = 0.0
    @State private var numPeople = 2
    @State private var tipPercentBecauseOfAmerica = 0.0
    
    @FocusState private var needsKeyboard: Bool

    var yourTotalToPay: Double {
        return (billAmount / Double(numPeople))
            * (1 + tipPercentBecauseOfAmerica)
    }

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField(
                        "Total Bill",
                        value: $billAmount,
                        format: .currency(
                            code: Locale.current.currency?.identifier ?? "AUD"
                        )
                    )
                    .keyboardType(.decimalPad)
                    .focused($needsKeyboard)

                    Picker("Number of people", selection: $numPeople) {
                        ForEach(2..<21, id: \.self) {
                            Text("\($0) people")
                        }
                    }
                    // .pickerStyle(.navigationLink)
                }

                Section("Would you like to leave a tip?") {
                    Picker(
                        "Tip percentage",
                        selection: $tipPercentBecauseOfAmerica
                    ) {
                        ForEach(predefinedTips, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }

                Section("You need to pay") {
                    Text(
                        yourTotalToPay,
                        format: .currency(
                            code: Locale.current.currency?.identifier ?? "AUD"
                        )
                    )
                    .fontWeight(.heavy)
                }
            }
            .navigationTitle("Split The Bill")
            .toolbar {
                if needsKeyboard {
                    Button("OK") {
                        needsKeyboard = false
                    }
                }
            }
        }
//        .onTapGesture {
//            // Note that the presence of this handler here will cause the number of people
//            // picker not to be selectable.
//            // To make it work properly, the gesture needs to be on something else, e.g. a clear backgroun
//            // or use a ZStack.
//            needsKeyboard = false
//        }
    }
}

#Preview {
    Project1ContentView()
}
