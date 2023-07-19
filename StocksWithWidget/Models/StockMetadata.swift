//
//  StockData.swift
//  StocksWithWidget
//
//  Created by YAUHENI LEVIN on 19.07.23.
//

import Foundation

struct StockMetadata: Decodable {
    let information: String
    let symbol: String
    let lastRefreshed: String
    let interval: String
    let outputSize: String
    let timeZone: String
    
    enum CodingKeys: String, CodingKey {
        case information = "1. Information"
        case symbol = "2. Symbol"
        case lastRefreshed = "3. Last Refreshed"
        case interval = "4. Interval"
        case outputSize = "5. Output Size"
        case timeZone = "6. Time Zone"
    }
}
