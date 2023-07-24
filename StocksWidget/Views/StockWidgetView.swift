//
//  StockWidgetView.swift
//  StocksWidgetExtension
//
//  Created by YAUHENI LEVIN on 18.07.23.
//

import SwiftUI

struct StocksWidgetEntryView : View {
    @Environment(\.widgetFamily) var widgetFamily
    var entry: Provider.Entry
    
    var body: some View {
        switch widgetFamily {
        case .systemSmall:
            StockWidgetSmallView(entry: entry)
                .widgetURL(entry.stockData?.url)
        case .systemMedium:
            Text("systemMedium")
        default:
            Text("systemMedium")
        }
        
    }
}
