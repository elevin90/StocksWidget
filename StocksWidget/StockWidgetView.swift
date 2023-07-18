//
//  StockWidgetView.swift
//  StocksWidgetExtension
//
//  Created by YAUHENI LEVIN on 18.07.23.
//

import SwiftUI

struct StocksWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text("Time:")
            Text(entry.date, style: .time)
            Text(entry.configuration.stock)
        }
        .containerBackground(.fill.tertiary, for: .widget)
    }
}
