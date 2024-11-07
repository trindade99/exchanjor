//
//  HomePageView.swift
//  Exchanjor
//
//  Created by Victor Lopes on 11/5/24.
//

import SwiftUI

struct HomePageView: View {
    @ObservedObject var appDefaults: AppDefaults
    @State var selectedRate: String = AppDefaults.shared.savedRates.rates.first?.key ?? ""
    var isExpanded: Bool {
        !appDefaults.favouriteRates.isEmpty
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .topLeading) {
                LinearGradient(
                    gradient: Gradient(colors: [Color.secondaryBackgroundColor, Color.mainBackgroundColor]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                .zIndex(-1)
                HStack(alignment: .top) {
                    if isExpanded {
                        FavouritesView(viewModel: .init(appDefaults: appDefaults, selectedRateBinding: $selectedRate))
                            .frame(width: geometry.size.width * 0.3, height: geometry.size.height)
                            .transition(.move(edge: .leading))
                            .zIndex(1)
                    }
                    
                    VStack(alignment: .leading) {
                        ChartViewCell(selectedRate: $selectedRate)
                            .frame(height: geometry.size.height * 0.3, alignment: .top)
                            .padding(.leading, 15)
                        ScrollView {
                            ForEach(Array(appDefaults.savedRates.rates.keys.enumerated()), id: \.element) { index, key in
                                if let value = appDefaults.savedRates.rates[key] {
                                    CapsuleViewCell(viewModel: .init(value: value, tag: key, longTouchAction: {
                                        appDefaults.favouriteRates.updateValue(value, forKey: key)
                                        appDefaults.updateFavouriteRates()
                                    }, isFavourite: false, rate: appDefaults.ratesUpdates, selectedRateBinding: $selectedRate))
                                    .frame(height: geometry.size.height/7)
                                    .padding(.trailing, 10)
                                }
                            }
                        }
                        .padding(.horizontal, 5)
                        .scrollIndicators(.hidden)
                    }
                }
                .padding(.top, 5)
                .padding(.leading, 5)
                .animation(.easeInOut(duration: 0.5), value: isExpanded)
            }
        }
    }
}
