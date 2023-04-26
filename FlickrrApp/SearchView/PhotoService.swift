//
//  PhotoService.swift
//  FlickrrApp
//
//  Created by Manikanta Sirumalla on 07/02/23.

import Foundation
import Combine

struct PhotoService {
    
    let apiService = APIService()
    
    func fetchPhotos(query: String) -> AnyPublisher<[Photo], Error> {
        let urlString = apiService.baseURL +
        "/?method=flickr.photos.search&api_key=\(apiService.apiKey)&text=%22\(query)%22"
        + apiService.format
        guard let photoURL = URL(string: urlString) else {
            return Fail(error: NetworkError.invalidURL)
                .eraseToAnyPublisher()
        }
        return apiService.fetchData(url: photoURL)
            .map(\PhotoModel.photos.photo)
            .mapError { _ in NetworkError.networkFailure }
            .eraseToAnyPublisher()
    }
}
