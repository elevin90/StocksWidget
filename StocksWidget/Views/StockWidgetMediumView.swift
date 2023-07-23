//
//  StockWidgetMediumView.swift
//  StocksWidgetExtension
//
//  Created by YAUHENI LEVIN on 23.07.23.
//

import SwiftUI
import WidgetKit

struct StockWidgetMediumView: View {
    let entry: StockTimelineEntry
    
    var body: some View {
        VStack {
            Text(entry.date, style: .time)
            Text(entry.configuration.stock?.symbol ?? "")
            Text(entry.stockData?.latestClose ?? "Nsn close")
            LineChart(values: entry.stockData?.closeValues ?? [])
                .fill (
                    LinearGradient(gradient: Gradient(colors: [.green.opacity(0.7),
                                                               .green.opacity(0.2),
                                                               .green.opacity(0)]),
                                   startPoint: .top, endPoint: .bottom)
                )
                .frame( width: 150, height: 150)
        }
        .containerBackground(.fill.tertiary, for: .widget)
    }
}

#Preview {
    StockWidgetSmallView(entry: StockTimelineEntry(date: .now,
                                                   configuration: ConfigurationAppIntent(),
                                                   stockData: nil))
    .previewContext(WidgetPreviewContext(family: .systemMedium))
}
