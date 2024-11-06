//
//  ChartViewCell.swift
//  Exchanjor
//
//  Created by Victor Lopes on 11/5/24.
//

import SwiftUI
import Charts

struct ChartViewCell: View {
    @Binding private var selectedRate: String
    @ObservedObject private var appDefaults = AppDefaults.shared
    @State private var rate: Bool = false
    var historicalData: [Double] {
        var rtn: [Double] = []
        let history = appDefaults.getRatesHistory()
        history.forEach{(entry) in
            guard let historicalRate = entry.rates[selectedRate] else {return}
            rtn.append(historicalRate)
        }
        return rtn
    }
    
    init(selectedRate: Binding<String>) {
        self._selectedRate = selectedRate
    }
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack(alignment: .bottomLeading) {
                Chart {
                    ForEach(Array(historicalData.enumerated()), id: \.offset) { index, value in
                        AreaMark(
                            x: .value("Index", index),
                            y: .value("Value", value)
                        )
                        .foregroundStyle(
                            LinearGradient(
                                gradient: Gradient(colors: [returnAccentColor().opacity(0.6), returnAccentColor().opacity(0.1)]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        LineMark(
                            x: .value("Index", index),
                            y: .value("Value", value)
                        )
                        .foregroundStyle(
                            Color(returnAccentColor())
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
    
    private func returnAccentColor() -> Color {
        return appDefaults.ratesUpdates[selectedRate] ?? false ? .red : .green
    }
}

//#Preview {
//    ZStack{
//        Color(.black)
//        ChartViewCell()
//            .frame(width: 300, height: 300)
//    }
//}
