//
//  StocksWidget.swift
//  StocksWidget
//
//  Created by YAUHENI LEVIN on 18.07.23.
//

import WidgetKit
import SwiftUI

struct StocksWidget: Widget {
    let kind: String = "StocksWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind,
                               intent: ConfigurationAppIntent.self,
                               provider: Provider()) { entry in
            StocksWidgetEntryView(entry: entry)
        }
        .supportedFamilies([.systemSmall, .systemMedium])
        .configurationDisplayName("Stocks Widget")
        .description("Checks prices for selected stocks")
    }
}

#Preview(as: .systemSmall) {
    StocksWidget()
}
timeline: {
    StockTimelineEntry(date: .now,
                       configuration: ConfigurationAppIntent(),
                       stockData: nil)
}
