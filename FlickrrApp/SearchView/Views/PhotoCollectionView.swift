//
//  PhotoCollectionView.swift
//  FlickrrApp
//
//  Created by Manikanta Sirumalla on 08/02/23.
//

import SwiftUI
import Kingfisher

struct PhotoCollectionView: View {
    
    @Binding var selectedPhoto: Photo?
    let photos: [Photo]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                LazyVGrid(columns: Array(repeating: .init(.adaptive(minimum: geometry.size.width/3)
                                                          ,spacing: 2),count: 3)) {
                    ForEach(self.photos, id: \.id) { photo in
                        KFImage(URL(string: photo.url)!)
                            .resizable()
                            .frame(width: (geometry.size.width/3), height: (geometry.size.width/3))
                            .onTapGesture {
                                self.selectedPhoto = photo
                            }
                    }
                }.background(Color.white)
            }
        }
    }
}

