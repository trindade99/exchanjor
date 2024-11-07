//
//  FavouritesViewModel.swift
//  Exchanjor
//
//  Created by Victor Lopes on 11/7/24.
//

import Foundation
import Combine
import SwiftUI

@MainActor
class FavouritesViewModel: ObservableObject {
    @ObservedObject var appDefaults: AppDefaults
    var selectedRateBinding: Binding<String>
    var selectedRate: String {
        get { selectedRateBinding.wrappedValue }
        set { selectedRateBinding.wrappedValue = newValue }
    }
    
    init(appDefaults: AppDefaults, selectedRateBinding: Binding<String>) {
        self.appDefaults = appDefaults
        self.selectedRateBinding = selectedRateBinding
    }
    
    func generateCapsuleViewModel(value: Double, key: String) -> CapsuleViewModel {
        return CapsuleViewModel(value: value,
                                tag: key,
                                longTouchAction: {
                                    self.appDefaults.favouriteRates.removeValue(forKey: key)
                                    self.appDefaults.updateFavouriteRates()},
                                isFavourite: true,
                                rate: appDefaults.ratesUpdates,
                                selectedRateBinding: selectedRateBinding)
    }
}
