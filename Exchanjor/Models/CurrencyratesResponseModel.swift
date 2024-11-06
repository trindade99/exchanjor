//
//  CurrencyratesResponseModel.swift
//  Exchanjor
//
//  Created by Victor Lopes on 11/5/24.
//

import Foundation

struct CurrencyRatesResponseModel: Codable {
    let success: Bool
    let terms: String
    let privacy: String
    let timestamp: Int
    let target: String
    let rates: [String: Double]
}
