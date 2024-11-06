//
//  AppDefaults.swift
//  Exchanjor
//
//  Created by Victor Lopes on 11/6/24.
//
import Foundation
import SwiftUI
import Combine
import Network

class AppDefaults: ObservableObject {
    static let shared = AppDefaults() // Singleton for easy access across the app
    
    @Published var ratesUpdates: [String: Bool]
    @Published var savedRates: CurrencyRatesResponseModel {
        didSet {
            save(savedRates, forKey: "savedRates")
        }
    }
    @Published var favouriteRates: [String: Double] {
        didSet {
            updateFavouriteRates()
        }
    }
    
    private var monitor: NWPathMonitor
    private var isConnected: Bool = false
    
    private init() {
        // Load saved data from UserDefaults when initializing
        self.savedRates = load(forKey: "savedRates", as: CurrencyRatesResponseModel.self) ?? MockData.currencyRatesResponse
        self.favouriteRates = load(forKey: "favouriteRates", as: [String: Double].self) ?? MockData.favoritedRates.rates
        self.ratesUpdates = [:]
        
        // Initialize Network Monitor
        self.monitor = NWPathMonitor()
        self.monitor.pathUpdateHandler = { path in
            self.isConnected = path.status == .satisfied
        }
        let queue = DispatchQueue(label: "NetworkMonitor")
        self.monitor.start(queue: queue)
    }
    
    public func updateFavouriteRates() {
        save(favouriteRates, forKey: "favouriteRates")
    }
    
    public func updateRatesUpdates(rates: [String: Bool]) {
        ratesUpdates = rates
    }
    
    func handleRatesUpdate() async {
        // If there's no internet connection, use the saved rates as they are
        if !isConnected {
            print("No internet, using saved rates.")
            return
        }
        
        // Otherwise, fetch the new data
        do {
            let newData = try await APIService().fetchCoinLayerData() // Fetch new data from API
            if let response = APIService().decodeCoinLayerData(from: newData) {
                DispatchQueue.main.async {
                    self.savedRates = response
                }
                print("Rates updated from API")
            } else {
                print("Failed to decode fetched data.")
            }
        } catch {
            print("Error fetching new data: \(error)")
        }
    }
    
    func updateRatesUpdates() -> [String: Bool] {
        var rtn: [String: Bool] = [:]
        let oldRates = MockData.oldRatesResponse
        let newRates = AppDefaults.shared.savedRates
        newRates.rates.forEach { (newRate) in
            guard let oldRate = oldRates.rates[newRate.key] else {
                rtn.updateValue(true, forKey: newRate.key)
                return
            }
            if oldRate >= newRate.value {
                rtn.updateValue(false, forKey: newRate.key)
            } else {
                rtn.updateValue(true, forKey: newRate.key)
            }
        }
        objectWillChange.send()
        return rtn
    }
    
    func getRatesHistory() -> [CurrencyRatesResponseModel] {
        var rtn: [CurrencyRatesResponseModel] = []
        rtn.append(AppDefaults.shared.savedRates)
        rtn.append(MockData.oldRatesResponse)
        return rtn
    }
}

// General-purpose save function for any Encodable data
fileprivate func save<T: Encodable>(_ value: T, forKey key: String) {
    let encoder = JSONEncoder()
    if let encoded = try? encoder.encode(value) {
        UserDefaults.standard.set(encoded, forKey: key)
    }
}

// General-purpose load function for any Decodable data
fileprivate func load<T: Decodable>(forKey key: String, as type: T.Type) -> T? {
    if let savedData = UserDefaults.standard.data(forKey: key) {
        let decoder = JSONDecoder()
        return try? decoder.decode(type, from: savedData)
    }
    return nil
}
