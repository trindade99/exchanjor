//
//  ExchanjorApp.swift
//  Exchanjor
//
//  Created by Victor Lopes on 11/5/24.
//

import SwiftUI
import SwiftData

@main
struct ExchanjorApp: App {
    // those vars are declared here simply for the simplicity of this MVP!
    @ObservedObject var appDefaults = AppDefaults.shared
    @State var selectedRate: String = AppDefaults.shared.savedRates.rates.first?.key ?? ""
    var body: some Scene {
        WindowGroup {
            HomePageView(viewModel: .init(appDefaults: appDefaults, selectedRateBinding: $selectedRate))
                .task {
                    await appDefaults.handleRatesUpdate()
                    DispatchQueue.main.async {
                        appDefaults.updateRatesUpdates(rates: appDefaults.updateRatesUpdates())
                    }
                }
        }
    }
}
