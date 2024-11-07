//
//  ExchanjorTests.swift
//  ExchanjorTests
//
//  Created by Victor Lopes on 11/5/24.
//

import Testing
import XCTest
@testable import Exchanjor

struct ExchanjorTests {
    
    @Test func testFetchFromAPINotNilOrError() async throws {
        do {
            let apiService = APIService()
            let data = try await apiService.fetchCoinLayerData()
            let response = apiService.decodeCoinLayerData(from: data)
            
            XCTAssertNotNil(response)
            #expect(response != nil)
        }catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    @Test func testAppDefaultsNotLoadingMockData() async throws {
        let appDefaults = AppDefaults.shared
        let savedRates = AppDefaults.shared.savedRates
        let favouriteRates = AppDefaults.shared.favouriteRates
        let oldRates = AppDefaults.shared.getRatesHistory()
        
        XCTAssertNotNil(appDefaults)
        XCTAssertNotEqual(savedRates.timestamp, MockData.oldRatesResponse.timestamp)
        XCTAssertNotEqual(favouriteRates.count, 1)
        XCTAssertNotEqual(favouriteRates.first?.key, MockData.favoritedRates.rates.first?.key)
        XCTAssertNotEqual(oldRates.count, 0)
        XCTAssertNotEqual(oldRates.first?.timestamp, MockData.oldRatesResponse.timestamp)
    }
    
}
