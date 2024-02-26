//
//  InputView.swift
//  BMICalculator
//
//  Created by Micah Moore on 2/25/24.
//

import SwiftUI

struct InputView: View {
    @State private var height: String = ""
    @State private var weight: String = ""
    @State private var selectedUnit: UnitType = .metric
    @State private var navigateToResult = false 
    
    
    @State private var calculatedBMI: BMIResult = BMIResult(value: 0, category: "Unknown")

    enum UnitType: String, CaseIterable, Identifiable {
        case metric = "Metric (m, kg)"
        case imperial = "Imperial (inches, lbs)"
        var id: String { self.rawValue }
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Your details")) {
                    TextField("Height", text: $height)
                        .keyboardType(.decimalPad)
                    TextField("Weight", text: $weight)
                        .keyboardType(.decimalPad)
                    Picker("Unit", selection: $selectedUnit) {
                        ForEach(UnitType.allCases) { unit in
                            Text(unit.rawValue).tag(unit)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Button("Calculate BMI") {
                    
                    calculatedBMI = BMICalculator.calculateBMI(height: Double(height) ?? 0, weight: Double(weight) ?? 0, unit: selectedUnit)
                    self.navigateToResult = true
                }
                .disabled(height.isEmpty || weight.isEmpty)
                
                
                NavigationLink(destination: ResultView(bmiResult: calculatedBMI), isActive: $navigateToResult) {
                    EmptyView()
                }.hidden()
            }
            .navigationTitle("BMI Calculator")
            .navigationBarItems(trailing: Button("Reset") {
                self.height = ""
                self.weight = ""
                self.selectedUnit = .metric
                self.navigateToResult = false
            })
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}
