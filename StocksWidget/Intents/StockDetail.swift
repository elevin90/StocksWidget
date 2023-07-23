//
//  StockDetail.swift
//  StocksWidgetExtension
//
//  Created by YAUHENI LEVIN on 23.07.23.
//

import AppIntents

struct CharacterDetailQuery: EntityQuery {
    func entities(for identifiers: [StockDetail.ID]) async throws -> [StockDetail] {
        StockDetail.allCharacters.filter { identifiers.contains($0.id) }
    }
    
    func suggestedEntities() async throws -> [StockDetail] {
        StockDetail.allCharacters
    }
    
    func defaultResult() async -> StockDetail? {
        try? await suggestedEntities().first
    }
}
