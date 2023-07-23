//
//  CharacterDetailQuery.swift
//  StocksWidgetExtension
//
//  Created by YAUHENI LEVIN on 23.07.23.
//

import AppIntents

struct StockDetail: AppEntity {
    let id = UUID().uuidString
    let title: String
    let symbol: String
    
    var displayRepresentation: DisplayRepresentation {
        DisplayRepresentation(title: "\(title) \(symbol)")
    }
    
    static var typeDisplayRepresentation: TypeDisplayRepresentation = "Character"
    static var defaultQuery = CharacterDetailQuery()
    static let allCharacters: [StockDetail] = [
        StockDetail(title: "Apple", symbol: "AAPL"),
        StockDetail(title: "IBM", symbol: "IBM"),
        StockDetail(title: "Microsoft Corp", symbol: "MSFT")
    ]
}
