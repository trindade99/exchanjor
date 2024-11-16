//
//  ChartViewModel.swift
//  Exchanjor
//
//  Created by Victor Lopes on 11/7/24.
//

import Foundation
import Combine
import SwiftUI

@MainActor
class ChartViewModel: ObservableObject {
    @ObservedObject var appDefaults: AppDefaults
    var selectedRateBinding: Binding<String>
    var selectedRate: String {
        get { selectedRateBinding.wrappedValue }
        set { selectedRateBinding.wrappedValue = newValue }
    }
    var historicalData: [Double]
    
    init(appDefaults: AppDefaults, selectedRateBinding: Binding<String>, historicalData: [Double]) {
        self.appDefaults = appDefaults
        self.selectedRateBinding = selectedRateBinding
        self.historicalData = historicalData
    }
    
    func getAccentColor() -> Color {
        return appDefaults.ratesUpdates[selectedRate] ?? false ? .red : .green
    }
}

