//
//  ApiService.swift
//  Exchanjor
//
//  Created by Victor Lopes on 11/5/24.
//

import Foundation

//service class to talk to the API
class APIService {
    
    func fetchCoinLayerData() async throws -> Data {
        // Define the URL with the access key
        guard let accessKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String else { throw URLError(.unknown) }
        guard let url = URL(string: "http://api.coinlayer.com/live?access_key=\(accessKey)") else {
            throw URLError(.badURL)
        }
        
        // Perform the async request
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // Check if the response is valid
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        return data
    }
    
    func decodeCoinLayerData(from data: Data) -> CurrencyRatesResponseModel? {
        let decoder = JSONDecoder()
        
        // Attempt to decode the JSON data into CoinLayerResponse
        do {
            let response = try decoder.decode(CurrencyRatesResponseModel.self, from: data)
            return response
        } catch {
            print("Error decoding JSON: \(error)")
            return nil
        }
    }

}
