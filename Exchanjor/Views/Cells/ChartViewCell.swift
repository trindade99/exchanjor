//
//  ChartViewCell.swift
//  Exchanjor
//
//  Created by Victor Lopes on 11/5/24.
//

import SwiftUI
import Charts

struct ChartViewCell: View {
    let data = [1, 5, 20, 4, 33, 7, 2, 12, 5, 30, 45, 2, 3, 4, 8]
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack(alignment: .bottomLeading) {
                //                Color(Color.mainBackgroundColor)
                //                    .frame(width: geometry.size.width ,height: geometry.size.height, alignment: .top)
                //                    .cornerRadius(10)
                //                    .padding(.trailing, 15)
                //                    .zIndex(-1)
                Chart {
                    ForEach(Array(data.enumerated()), id: \.offset) { index, value in
                        AreaMark(
                            x: .value("Index", index),
                            y: .value("Value", value)
                        )
                        .foregroundStyle(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.green.opacity(0.6), Color.green.opacity(0.1)]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        LineMark(
                            x: .value("Index", index),
                            y: .value("Value", value)
                        )
                        .foregroundStyle(
                            Color(.green)
                        )
                    }
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .zIndex(0)
                .chartXAxis {
                    AxisMarks(preset: .aligned) { _ in
                        AxisGridLine()
                            .foregroundStyle(.white)
                        AxisTick()
                            .foregroundStyle(.white)
                        AxisValueLabel()
                            .foregroundStyle(.white)
                    }
                }
                .chartYAxis {
                    AxisMarks(preset: .aligned) { _ in
                        AxisGridLine()
                            .foregroundStyle(.white)
                        AxisTick()
                            .foregroundStyle(.white)
                        AxisValueLabel()
                            .foregroundStyle(.white.opacity(0))
                    }
                }
            }
        }
    }
}

#Preview {
    ChartViewCell()
        .frame(width: 300, height: 300)
}
