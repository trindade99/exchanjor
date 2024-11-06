//
//  CapsuleViewModel.swift
//  Exchanjor
//
//  Created by Victor Lopes on 11/6/24.
//

import Foundation
import Combine
import SwiftUI

@MainActor
class CapsuleViewModel: ObservableObject {
    @Published var value: Double
    @Published var tag: String
    var longTouchAction: () -> Void = { }
    @Published var isFavourite: Bool
    @State var rate: [String: Bool]
    var selectedRateBinding: Binding<String>
    var selectedRate: String {
        get { selectedRateBinding.wrappedValue }
        set { selectedRateBinding.wrappedValue = newValue }
    }
    
    init(value: Double, tag: String, longTouchAction: @escaping () -> Void, isFavourite: Bool, rate: [String : Bool], selectedRateBinding: Binding<String>) {
        self.value = value
        self.tag = tag
        self.longTouchAction = longTouchAction
        self.isFavourite = isFavourite
        self.rate = rate
        self.selectedRateBinding = selectedRateBinding
    }
    
}
