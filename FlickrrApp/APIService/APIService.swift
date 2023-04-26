//
//  APIService.swift
//  FlickrrApp
//
//  Created by Manikanta Sirumalla on 07/02/23.
//

import Foundation
import SwiftUI
import Combine

struct APIService {
    
    let baseURL = "https://www.flickr.com/services/rest"
    let apiKey = "fb73aca88471aa68a5108b8ee9b420ea"
    let format = "&format=json&nojsoncallback=1"
   
    func fetchData<T: Decodable>(url: URL) -> AnyPublisher<T, Error> {
        URLSession.shared
            .dataTaskPublisher(for: url)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse,
                      (200..<300).contains(httpResponse.statusCode) else {
                    throw NetworkError.networkFailure
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
