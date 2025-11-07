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
    private let lengthUnits = [
        UnitLength.millimeters, UnitLength.feet, UnitLength.yards,
        UnitLength.meters, UnitLength.kilometers, UnitLength.miles,
        UnitLength.astronomicalUnits,
    ]
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

    @State private var sourceLengthUnit = UnitLength.meters
    @State private var targetLengthUnit = UnitLength.millimeters

    private var convertedMass: String {
        let measurement = Measurement(value: sourceMass, unit: sourceMassUnit)
        let formatter = MeasurementFormatter()
        formatter.unitStyle = .short
        formatter.unitOptions = .providedUnit
        return formatter.string(from: measurement.converted(to: targetMassUnit))
    }

    private var convertedLength: String {

        let measurement = Measurement(
            value: sourceLength,
            unit: sourceLengthUnit
        )
        let formatter = MeasurementFormatter()
        formatter.unitStyle = .short
        formatter.unitOptions = .providedUnit
        return formatter.string(
            from: measurement.converted(to: targetLengthUnit)
        )
    }

    var body: some View {
        TabView {
            Tab("Mass", systemImage: "square.and.arrow.up.badge.clock") {
                NavigationView {
                    Form {
                        TextField(
                            "Amount",
                            value: $sourceMass,
                            format: .number
                        )
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.decimalPad)

                        Picker("From Unit", selection: $sourceMassUnit) {
                            ForEach(massUnits, id: \.self) {
                                Text($0.symbol)
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

            Tab("Length", systemImage: "arrow.down.left.arrow.up.right") {
                NavigationView {
                    Form {
                        TextField(
                            "Amount",
                            value: $sourceLength,
                            format: .number
                        )
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.decimalPad)

                        Picker("From Unit", selection: $sourceLengthUnit) {
                            ForEach(lengthUnits, id: \.self) {
                                Text($0.symbol)
                            }
                        }
                        .pickerStyle(.segmented)

                        Picker("To Unit", selection: $targetLengthUnit) {
                            ForEach(lengthUnits, id: \.self) {
                                Text($0.symbol)
                            }
                        }
                        .pickerStyle(.segmented)

                        Text(convertedLength)
                            .font(.headline)
                            .padding()
                    }
                    .navigationTitle("Length")
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
