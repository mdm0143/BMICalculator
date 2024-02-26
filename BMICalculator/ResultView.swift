//
//  ResultView.swift
//  BMICalculator
//
//  Created by Micah Moore on 2/25/24.
//

import SwiftUI

struct ResultView: View {
    var bmiResult: BMIResult

    var body: some View {
        VStack {
            Text("Your BMI")
                .font(.title)
            Text(String(format: "%.2f", bmiResult.value))
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            Text(bmiResult.category)
                .font(.title2)
                .foregroundColor(bmiResult.categoryColor)
        }
        .padding()
        .navigationTitle("BMI Result")
    }
}
