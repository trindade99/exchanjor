//
//  CapsuleViewCell.swift
//  Exchanjor
//
//  Created by Victor Lopes on 11/5/24.
//

import SwiftUI

struct CapsuleViewCell: View {
    var body: some View {
        GeometryReader{ geometry in
            ZStack(alignment: .top) {
                Color(.white)
                    .zIndex(-2)
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                    .cornerRadius(15)
                    .brightness(10)
                    .blur(radius: 2)
                    .offset(x: 0.35, y: -0.65)
                Color(.green)
                    .zIndex(-2)
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                    .cornerRadius(15)
                    .blur(radius: 2)
                    .offset(x: -1, y: 1)
                LinearGradient(
                    gradient: Gradient(colors: [Color.secondaryBackgroundColor.opacity(0.9), Color.green]),
                    startPoint: UnitPoint(x: 0, y: 0.67),
                    endPoint: UnitPoint(x: -0.05, y: 1.1)
                )
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                .cornerRadius(15)
                .zIndex(-1)
                Text("0.3")
                    .font(.largeTitle)
                    .frame(minWidth: 100, alignment: .trailing)
                    .bold()
                    .foregroundColor(.red)
                    .padding(.top, 15)
                    .padding(.trailing, 10)
            }
        }
    }
}

#Preview {
    ZStack{
        Color(.black)
        CapsuleViewCell()
            .frame(width: 150, height: 120)
    }
}
