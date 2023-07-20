//
//  StockService.swift
//  StocksWithWidget
//
//  Created by YAUHENI LEVIN on 19.07.23.
//

import Combine
import Foundation

final class StocksService {
    func getStockData(for symbol: String) -> AnyPublisher<StockData, Error> {
        let urlString = "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=IBM&interval=5min&apikey=J8Z0G4S0U0D80LCP"
        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return element.data
            }
            .decode(type: StockData.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
