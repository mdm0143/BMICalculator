//
//  BMICalculator.swift
//  BMICalculator
//
//  Created by Micah Moore on 2/25/24.
//

import SwiftUI

struct BMIResult {
    var value: Double
    var category: String
    var categoryColor: Color {
        switch value {
        case ..<18.5: return .blue
        case 18.5..<24.9: return .green
        case 24.9..<29.9: return .yellow
        default: return .red
        }
    }
}

class BMICalculator {
    static func calculateBMI(height: Double, weight: Double, unit: InputView.UnitType) -> BMIResult {
        let bmiValue: Double
        
        if unit == .metric {
            // BMI formula for metric units
            bmiValue = weight / (height * height)
        } else {
            // BMI formula for imperial units
            bmiValue = 703 * (weight / (height * height))
        }
        
        let category: String
        switch bmiValue {
        case ..<18.5:
            category = "Underweight"
        case 18.5..<24.9:
            category = "Normal weight"
        case 24.9..<29.9:
            category = "Overweight"
        default:
            category = "Obesity"
        }
        
        return BMIResult(value: bmiValue, category: category)
    }
}
