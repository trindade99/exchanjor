//
//  FavouritesView.swift
//  Exchanjor
//
//  Created by Victor Lopes on 11/5/24.
//

import SwiftUI

struct FavouritesView: View {
    let data = [1, 5, 20, 4, 33, 7, 2, 12, 5, 30, 45, 2, 3, 4, 8]
    var body: some View {
        // we're using GeometryReader size to keep the app fully responsive
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Text("Favourites")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .frame(maxWidth: geometry.size.width, alignment: .leading)
                    .padding(.leading, 10)
                    .contentMargins(10)
                ScrollView {
                    ForEach(Array(data.enumerated()), id: \.offset) {_ in
                        CapsuleViewCell()
                            .frame(width: geometry.size.width, height: geometry.size.height/7)
                            .padding(.horizontal, 10)
                            .contentMargins(10)
                            .padding(.vertical, 10)
                    }
                }
                .padding(.horizontal, 5)
                .scrollIndicators(.hidden)
            }
        }
    }
}

#Preview {
    ZStack {
        Color(.black)
        FavouritesView()
            .frame(width: 100)
    }
}
