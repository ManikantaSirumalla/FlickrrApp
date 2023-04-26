//
//  ImageView.swift
//  FlickrrApp
//
//  Created by Manikanta Sirumalla on 13/02/23.
//

import SwiftUI
import Kingfisher

struct DetailedImageView: View {
    
    let imagePadding: CGFloat = 10
    var image: Photo
    
    var body: some View {
        KFImage(URL(string: image.url)!)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(imagePadding)
    }
}
