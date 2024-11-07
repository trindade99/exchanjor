//
//  CapsuleViewCell.swift
//  Exchanjor
//
//  Created by Victor Lopes on 11/5/24.
//

import SwiftUI

struct CapsuleViewCell: View {
    @ObservedObject var viewModel: CapsuleViewModel
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                ZStack(alignment: .top) {
                    Color(.white)
                        .zIndex(-2)
                        .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                        .cornerRadius(15)
                        .blur(radius: 2)
                        .offset(x: 0.35, y: -0.65)
                    
                    Color(checkRate() ? .red : .green)
                        .zIndex(-2)
                        .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                        .cornerRadius(15)
                        .blur(radius: 2)
                        .offset(x: -1, y: 1)
                    
                    LinearGradient(
                        gradient: Gradient(colors: [Color.secondaryBackgroundColor.opacity(0.9), viewModel.rate[viewModel.tag] ?? false  ? .red : .green]),
                        startPoint: UnitPoint(x: 0, y: 0.67),
                        endPoint: UnitPoint(x: -0.05, y: 1.1)
                    )
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                    .cornerRadius(15)
                    .zIndex(-1)
                    
                    HStack(alignment: .center) {
                        Spacer()
                        Text(String(format: "%.2f", viewModel.value))
                            .font(.largeTitle)
                            .lineLimit(1)
                            .minimumScaleFactor(0.1)
                            .frame(maxWidth: 50, alignment: .trailing)
                            .bold()
                            .foregroundColor(checkRate() ? .red : .green)
                            .padding(.top, 15)
                            .padding(.trailing, 10)
                    }
                }
                Text(viewModel.tag)
                    .font(.system(size: geometry.size.width * 0.35, weight: .bold))
                    .frame(maxWidth: geometry.size.width, alignment: .leading)
                    .lineLimit(1)
                    .minimumScaleFactor(0.1)
                    .foregroundColor(checkRate() ? Color.red.opacity(0.3) : Color.green.opacity(0.3))
                    .padding(5)
            }
            .onTapGesture {
                viewModel.selectedRate = viewModel.tag
            }
            .background(Color.clear) // Transparent background to prevent clipping
            .cornerRadius(15)
            .padding(5)
            .contextMenu {
                //ideally this would be also an external element configured by the viewModel
                if(!viewModel.isFavourite) {
                    Button(action: {
                        viewModel.longTouchAction()
                    }) {
                        Text("Favourite")
                        Image(systemName: "star")
                    }
                }else {
                    Button(action: {
                        viewModel.longTouchAction()
                    }) {
                        Text("Remove")
                        Image(systemName: "trash")
                    }
                }
            }
        }
    }
    
    func checkRate() -> Bool {
        return viewModel.rate[viewModel.tag] ?? false
    }
}
