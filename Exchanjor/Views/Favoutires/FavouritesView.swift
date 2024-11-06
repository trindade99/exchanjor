//
//  FavouritesView.swift
//  Exchanjor
//
//  Created by Victor Lopes on 11/5/24.
//

import SwiftUI

struct FavouritesView: View {
    @ObservedObject var appDefaults: AppDefaults
    @Binding var selectedRateBinding: String
    
    var body: some View {
        // Using GeometryReader size to keep the app fully responsive
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Text("Favourites:")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .frame(maxWidth: geometry.size.width, alignment: .leading)
                    .padding(.leading, 10)
                
                ScrollView {
                    ForEach(Array(appDefaults.favouriteRates.keys.enumerated()), id: \.element) { index, key in
                        if let value = appDefaults.favouriteRates[key] {
                            CapsuleViewCell(viewModel: .init(value: value, tag: key, longTouchAction: {
                                appDefaults.favouriteRates.removeValue(forKey: key)
                                appDefaults.updateFavouriteRates()
                            }, isFavourite: true, rate: appDefaults.ratesUpdates, selectedRateBinding: $selectedRateBinding))
                            .frame(width: geometry.size.width - 20, height: geometry.size.height * 0.125)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                        }
                    }
                }
                .padding(.horizontal, 5)
                .scrollIndicators(.hidden)
            }
            .padding(.top, 10) // To add some top padding for the title
        }
    }
}
