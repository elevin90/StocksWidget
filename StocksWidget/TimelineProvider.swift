//
//  TimelineProvider.swift
//  StocksWidgetExtension
//
//  Created by YAUHENI LEVIN on 18.07.23.
//

import WidgetKit
import AppIntents
import Combine

final class Provider: AppIntentTimelineProvider {
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
        let lock = NSLock()
        return await withCheckedContinuation {[weak self] continuation in
            guard let self else {
                return
            }
           
            self.createStockTimeLineEntry(date: .now,
                                     configuration: configuration) { entry in
                defer { lock.unlock() }
                lock.lock()
                
                continuation.resume(returning: entry)
            }
        }
    }
    
    func createStockSnapShotEntry(date: Date,
                                  configuration: ConfigurationAppIntent,
                                  completion: @escaping ((StockTimelineEntry) -> Void)) {
        StocksService.getStockData(for: configuration.stock?.symbol ?? "IBM")
            .sink { _ in
                
            } receiveValue: { stockData in
                completion(StockTimelineEntry(date: .now,
                                              configuration: configuration,
                                              stockData: stockData))
            }
            .store(in: &cancellables)
    }
    
    func createStockTimeLineEntry(date: Date,
                                  configuration: ConfigurationAppIntent,
                                  completion: @escaping ((Timeline<StockTimelineEntry>) -> Void)) {
        StocksService.getStockData(for: configuration.stock?.symbol ?? "IBM")
            .sink { _ in
                
            } receiveValue: { stockData in
                let entry = StockTimelineEntry(date: date,
                                               configuration: configuration,
                                               stockData: stockData)
                let timeline = Timeline(entries: [entry], policy: .atEnd)
                completion(timeline)
            }
            .store(in: &cancellables)
        
    }
}
