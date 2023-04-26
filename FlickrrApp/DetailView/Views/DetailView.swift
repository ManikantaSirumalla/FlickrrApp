//
//  DescriptionView.swift
//  FlickrrApp
//
//  Created by Manikanta Sirumalla on 08/02/23.
//

import SwiftUI

struct DetailView: View {
    
    @StateObject var detialVM = DetailViewModel()
    var image: Photo
    private let infoAlertTitle = LocalizedStringKey("cannot.fetch.description")
    
    var body: some View {
        VStack {
            DetailedImageView(image: image)
            DetailSheetView(photoDescription: $detialVM.photoDescription, image: image)
        }
        .onAppear {
            detialVM.fetchPhotoInfo(photoId: image.id)
        }
        .alert(isPresented: $detialVM.hasError) {
            showErrorAlert(title: infoAlertTitle, error: detialVM.error!)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(image: Photo.init(id: "51826965882", owner: "189960854@N08",
                                     secret: "33edbd9e2b", server: "65535",
                                     title: "Balakrishna: బాలయ్య‘మంగళవారం మెనూ’ మామూలుగా లేదుగా!"))
    }
}
