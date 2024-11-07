//
//  HomePageViewModel.swift
//  Exchanjor
//
//  Created by Victor Lopes on 11/7/24.
//

import Foundation
import Combine
import SwiftUI

@MainActor
class HomePageViewModel: ObservableObject {
    @ObservedObject var appDefaults: AppDefaults
    var selectedRateBinding: Binding<String>
    var selectedRate: String {
        get { selectedRateBinding.wrappedValue }
        set { selectedRateBinding.wrappedValue = newValue }
    }
    var isExpanded: Bool {
        !appDefaults.favouriteRates.isEmpty
    }
    
    init(appDefaults: AppDefaults, selectedRateBinding: Binding<String>) {
        self.appDefaults = appDefaults
        self.selectedRateBinding = selectedRateBinding
    }
    
    func getFavouritesViewModel() -> FavouritesViewModel {
        return FavouritesViewModel(appDefaults: appDefaults, selectedRateBinding: selectedRateBinding)
    }
    
    func getChartViewModel() -> ChartViewModel {
        let historicalData: [Double] = {
            var rtn: [Double] = []
            let history = appDefaults.getRatesHistory()
            history.forEach{(entry) in
                guard let historicalRate = entry.rates[selectedRate] else {return}
                rtn.append(historicalRate)
            }
            return rtn
        }()
        return ChartViewModel(appDefaults: appDefaults, selectedRateBinding: selectedRateBinding, historicalData: historicalData)
    }
    
    func getCapsuleViewModel(value: Double, key: String) -> CapsuleViewModel {
        return CapsuleViewModel(value: value,
                                tag: key,
                                longTouchAction: {
                                    self.appDefaults.favouriteRates.updateValue(value, forKey: key)
                                    self.appDefaults.updateFavouriteRates()},
                                isFavourite: false,
                                rate: appDefaults.ratesUpdates,
                                selectedRateBinding: selectedRateBinding)
    }
}
