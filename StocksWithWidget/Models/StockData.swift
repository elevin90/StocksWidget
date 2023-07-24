//
//  StockData.swift
//  StocksWithWidget
//
//  Created by YAUHENI LEVIN on 19.07.23.
//

import Foundation

struct StockData: Decodable, Identifiable {
    let id = UUID()
    let metaData: StockMetadata
    let timelineValuesData: [String: StockTimelineValuesData]
    
    enum CodingKeys: String, CodingKey {
        case metaData = "Meta Data"
        case timelineValuesData = "Time Series (5min)"
    }
    
    var latestClose: String {
        timelineValuesData.first?.value.close ?? "Nan"
    }
    
    var url: URL {
        guard let url = URL(string: "stockswidgetapp://symbol/\(metaData.symbol)") else {
            fatalError("Failed to get StockData url")
        }
        return url
    }
    
    var closeValues: [Double] {
        let rawValues = timelineValuesData.values.compactMap { Double($0.close) }
        let max = rawValues.max() ?? 0.0
        let min = rawValues.min() ?? 0.0
        
        return rawValues.map { ($0 - min * 0.95) / (max - min * 0.95) }
    }
}
