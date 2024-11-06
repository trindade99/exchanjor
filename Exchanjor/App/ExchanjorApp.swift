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
    @ObservedObject var appDefaults = AppDefaults.shared
    var body: some Scene {
        WindowGroup {
            HomePageView(appDefaults: appDefaults)
                .task {
                    await appDefaults.handleRatesUpdate()
                    DispatchQueue.main.async {
                        appDefaults.updateRatesUpdates(rates: appDefaults.updateRatesUpdates())
                    }
                }
        }
    }
}
