//
//  StockTimelineValuesData.swift
//  StocksWithWidget
//
//  Created by YAUHENI LEVIN on 19.07.23.
//

import Foundation

struct StockTimelineValuesData: Decodable {
    let open: String
    let high:String
    let low: String
    let close: String
    let volume: String
    
    enum CodingKeys: String, CodingKey {
        case open = "1. open"
        case high = "2. high"
        case low = "3. low"
        case close = "4. close"
        case volume = "5. volume"
    }
}
