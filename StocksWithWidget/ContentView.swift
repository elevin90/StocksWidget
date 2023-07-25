//
//  ContentView.swift
//  StocksWithWidget
//
//  Created by YAUHENI LEVIN on 18.07.23.
//

import SwiftUI
import WidgetKit

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onOpenURL(perform: { url in
            guard url.scheme == "stockswidgetapp",
                  url.host() == "symbol" else {
                return
            }
            let symbol = url.pathComponents[1]
            print("Upload data for \(symbol)")
        })
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Reload widget") {
                    WidgetCenter.shared.reloadAllTimelines()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
