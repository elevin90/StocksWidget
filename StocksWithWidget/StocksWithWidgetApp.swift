//
//  StocksWithWidgetApp.swift
//  StocksWithWidget
//
//  Created by YAUHENI LEVIN on 18.07.23.
//

import SwiftUI

@main
struct StocksWithWidgetApp: App {
    var body: some Scene {
        WindowGroup {
            if let defaults = UserDefaults(suiteName: "group.com.el.stockswithwidget") {
                ContentView()
                    .defaultAppStorage(defaults)
            }  else {
                fatalError("Cannot init UserDefaults")
            }
        }
    }
}
