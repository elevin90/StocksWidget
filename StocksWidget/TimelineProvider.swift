//
//  TimelineProvider.swift
//  StocksWidgetExtension
//
//  Created by YAUHENI LEVIN on 18.07.23.
//

import WidgetKit
import AppIntents
import Combine

struct Provider: AppIntentTimelineProvider {
    let stockService = StocksService()
    var cancellables: Set<AnyCancellable> = []
    
    func placeholder(in context: Context) -> StockTimelineEntry {
        StockTimelineEntry(date: Date(),
                           configuration: ConfigurationAppIntent(),
                           stockData: nil)
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> StockTimelineEntry {
        StockTimelineEntry(date: Date(),
                           configuration: configuration,
                           stockData: nil)
    }
    
    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<StockTimelineEntry> {
        var entries: [StockTimelineEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = StockTimelineEntry(date: entryDate,
                                           configuration: configuration,
                                           stockData: nil)
            entries.append(entry)
        }
        return Timeline(entries: entries, policy: .atEnd)
    }
    
    mutating func createStockTimeLineEntry(date: Date,
                                  configuration: ConfigurationAppIntent,
                                  completion: @escaping(StockTimelineEntry) -> Void) {
        stockService.getStockData(for: configuration.stock)
            .sink { _ in
                
            } receiveValue: { stockData in
                completion(StockTimelineEntry(date: .now,
                                               configuration: configuration,
                                               stockData: stockData))
            }
            .store(in: &cancellables)
    }
}
