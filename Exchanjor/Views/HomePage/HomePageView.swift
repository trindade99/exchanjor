//
//  HomePageView.swift
//  Exchanjor
//
//  Created by Victor Lopes on 11/5/24.
//

import SwiftUI

struct HomePageView: View {
    @ObservedObject var viewModel: HomePageViewModel
    
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
                    if viewModel.isExpanded {
                        FavouritesView(viewModel: viewModel.getFavouritesViewModel())
                            .frame(width: geometry.size.width * 0.3, height: geometry.size.height)
                            .transition(.move(edge: .leading))
                            .zIndex(1)
                    }
                    
                    VStack(alignment: .leading) {
                        ChartViewCell(viewModel: viewModel.getChartViewModel())
                            .frame(height: geometry.size.height * 0.3, alignment: .top)
                            .padding(.leading, 15)
                        ScrollView {
                            ForEach(Array(viewModel.appDefaults.savedRates.rates.keys.enumerated()), id: \.element) { index, key in
                                if let value = viewModel.appDefaults.savedRates.rates[key] {
                                    CapsuleViewCell(viewModel: viewModel.getCapsuleViewModel(value: value, key: key))
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
                .animation(.easeInOut(duration: 0.5), value: viewModel.isExpanded)
            }
        }
    }
}
