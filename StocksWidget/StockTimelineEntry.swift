//
//  TimelineEntry.swift
//  StocksWidgetExtension
//
//  Created by YAUHENI LEVIN on 18.07.23.
//

import WidgetKit

struct StockTimelineEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationAppIntent
    let stockData: StockData?
}
