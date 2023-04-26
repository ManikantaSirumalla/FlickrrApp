//
//  DetailViewModel.swift
//  FlickrrApp
//
//  Created by Manikanta Sirumalla on 13/02/23.
//

import SwiftUI
import Combine

final class DetailViewModel: ObservableObject {
    
    @Published var photoDescription = ""
    @Published var hasError = false
    @Published var error: Error?
    
    private let infoAPI = DescriptionService()
    private var cancellable = Set<AnyCancellable>()
    
    func fetchPhotoInfo(photoId: String) {
        infoAPI.fetchDescription(photoId: photoId)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.error = error
                    self.hasError = true
                case .finished:
                    break
                }
            } receiveValue: { description in
                self.photoDescription = description
            }
            .store(in: &cancellable)
    }
}
