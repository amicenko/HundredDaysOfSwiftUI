import SwiftUI

struct MainContentView: View {
    let predefinedTips = [0.0, 0.1, 0.15, 0.2, 0.25]

    @State private var billAmount = 0.0
    @State private var numPeople = 2
    @State private var tipPercentBecauseOfAmerica = 0.0

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

                    Picker("Number of people", selection: $numPeople) {
                        ForEach(2..<21, id: \.self) {
                            Text("\($0) people")
                        }
                    }
                    // .pickerStyle(.navigationLink)
                }
                
                Section("Would you like to leave a tip?") {
                    Picker("Tip percentage", selection: $tipPercentBecauseOfAmerica) {
                        ForEach(predefinedTips, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }

                Section {
//                    Text(
//                        billAmount,
//                        format: .currency(
//                            code: Locale.current.currency?.identifier ?? "AUD"
//                        )
//                    )
                }
            }
            .navigationTitle("Split The Bill")
        }
    }
}

#Preview {
    MainContentView()
}
