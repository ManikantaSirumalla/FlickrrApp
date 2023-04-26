//
//  SearchViewModel.swift
//  FlickrrApp
//
//  Created by Manikanta Sirumalla on 13/02/23.
//

import SwiftUI
import Combine

final class SearchViewModel: ObservableObject {
    
    @Published var photos = [Photo]()
    @Published var error: Error?
    @Published var isLoading = false
    @Published var hasError = false
    
    private let photoAPI = PhotoService()
    private var cancellable = Set<AnyCancellable>()
    
    func performPhotoSearch(with text: String) {
        self.isLoading = true
        photoAPI.fetchPhotos(query: text)
            .receive(on: DispatchQueue.main)
            .sink {  completion in
                switch completion {
                case .failure(let error):
                    self.error = error
                    self.hasError = true
                case .finished:
                    break
                }
                self.isLoading = false
            } receiveValue: { photos in
                self.photos = photos
            }
            .store(in: &cancellable)
    }
    
    func clearSearch() {
        self.photos = []
    }
}
