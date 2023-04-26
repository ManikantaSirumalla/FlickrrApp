//
//  DescriptionService.swift
//  FlickrrApp
//
//  Created by Manikanta Sirumalla on 08/02/23.
//

import Foundation
import Combine

struct DescriptionService {
    
    let apiService = APIService()
    
    func fetchDescription(photoId: String) -> AnyPublisher<String, Error> {
        let infoUrlString = apiService.baseURL +
        "/?method=flickr.photos.getInfo&api_key=\(apiService.apiKey)&photo_id=\(photoId)"
        + apiService.format
        guard let infoURL = URL(string: infoUrlString) else {
            return Fail(error: NetworkError.invalidURL)
                .eraseToAnyPublisher()
        }
        return apiService.fetchData(url: infoURL)
            .map(\DescriptionModel.photo.description._content)
            .mapError { _ in NetworkError.networkFailure }
            .eraseToAnyPublisher()
    }
}
