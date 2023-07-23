//
//  AppIntent.swift
//  StocksWidget
//
//  Created by YAUHENI LEVIN on 18.07.23.
//

import WidgetKit
import AppIntents

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Configuration"
    static var description = IntentDescription("This is an example widget.")
    
    // An example configurable parameter.
    @Parameter(title: "Stock")
    var stock: StockDetail?
    
    init() {}
    
    init(stockDetail: StockDetail) {
        self.stock = stockDetail
    }
}
