//
//  ContentView.swift
//  WeSplitLearning
//
//  Created by Andrew Micenko on 5/11/2025.
//

import SwiftUI

struct Challenge1ContentView: View {
    enum Tabs: Equatable, Hashable {
        case mass
        case length
    }

    private let unitType = ["Mass", "Length", "Volume", "Temperature"]
    private let lengthUnits = ["mm", "ft", "yd", "m", "km", "mi"]
    private let massUnits = [
        UnitMass.grams, UnitMass.kilograms, UnitMass.ounces, UnitMass.pounds,
        UnitMass.shortTons,
    ]

    @State private var sourceMass = 0.0
    @State private var sourceLength = 0.0
    @State private var sourceVolume = 0.0
    @State private var sourceTemperature = 0.0

    @State private var sourceMassUnit = UnitMass.kilograms
    @State private var targetMassUnit = UnitMass.grams

    private var convertedLength: Double {
        return 0.0
    }

    private var convertedMass: String {
        let measurement = Measurement(value: sourceMass, unit: sourceMassUnit)
        let formatter = MeasurementFormatter()
        formatter.unitStyle = .short
        formatter.unitOptions = .providedUnit
        return formatter.string(from: measurement.converted(to: targetMassUnit))
    }

    var body: some View {
        TabView {
            Tab("Mass", systemImage: "balance") {
                NavigationView {
                    Form {
                        TextField(
                            "Amount",
                            value: $sourceMass,
                            format: .number
                        )
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.decimalPad)

                        Picker("From Unit", selection: $sourceMassUnit) {
                            ForEach(massUnits, id: \.self) {
                                (unit: UnitMass) in
                                Text(unit.symbol)
                            }
                        }
                        .pickerStyle(.segmented)

                        Picker("To Unit", selection: $targetMassUnit) {
                            ForEach(massUnits, id: \.self) {
                                Text($0.symbol)
                            }
                        }
                        .pickerStyle(.segmented)

                        Text(convertedMass)
                            .font(.headline)
                            .padding()
                    }
                    .navigationTitle("Mass")
                }
            }
        }
        //                Section("Convert from") {
        //                    TextField("Amount", value: $sourceAmount, format: .number)
        //
        //                    Picker("Press Count: \(pressCount)") {
        //                        self.pressCount += 1
        //                    }
        //                    .keyboardShortcut(KeyboardShortcut("B", modifiers: EventModifiers.command))
        //                }

    }
}

#Preview {
    Challenge1ContentView()
}
