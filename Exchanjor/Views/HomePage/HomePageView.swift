//
//  HomePageView.swift
//  Exchanjor
//
//  Created by Victor Lopes on 11/5/24.
//

import SwiftUI

struct HomePageView: View {
    let data = [1, 5, 20, 4, 33, 7, 2, 12, 5, 30, 45, 2, 3, 4, 8]
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
                HStack(alignment: .top, content: {
                    FavouritesView()
                        .frame(width: geometry.size.width * 0.3, height: geometry.size.height, alignment: .leading)
                        .padding(.trailing, 20)
                    VStack(alignment: .leading) {
                        ChartViewCell()
                            .frame(width: geometry.size.width * 0.6 ,height: geometry.size.height * 0.3, alignment: .top)
                            .padding(15)
                        ScrollView{
                            ForEach(Array(data.enumerated()), id: \.offset) {_ in
                                CapsuleViewCell()
                                    .frame(width: geometry.size.width * 0.55, height: geometry.size.height/7)
                                    .padding(.horizontal, 10)
                                    .contentMargins(10)
                                    .padding(.vertical, 10)
                            }
                        }
                        .scrollIndicators(.hidden)
                    }
                })
                .padding(.top, 5)
                .padding(.leading, 5)
                
            }}
    }
}

#Preview {
    HomePageView()
}
