//
//  ChartViewCell.swift
//  Exchanjor
//
//  Created by Victor Lopes on 11/5/24.
//

import SwiftUI
import Charts

struct ChartViewCell: View {
    @ObservedObject var viewModel: ChartViewModel
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack(alignment: .bottomLeading) {
                Chart {
                    ForEach(Array(viewModel.historicalData.enumerated()), id: \.offset) { index, value in
                        AreaMark(
                            x: .value("Index", index),
                            y: .value("Value", value)
                        )
                        .foregroundStyle(
                            LinearGradient(
                                gradient: Gradient(colors: [viewModel.getAccentColor().opacity(0.6), viewModel.getAccentColor().opacity(0.1)]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        LineMark(
                            x: .value("Index", index),
                            y: .value("Value", value)
                        )
                        .foregroundStyle(
                            Color(viewModel.getAccentColor())
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

