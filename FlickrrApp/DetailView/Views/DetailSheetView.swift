//
//  ImageView.swift
//  FlickrrApp
//
//  Created by Manikanta Sirumalla on 13/02/23.
//

import SwiftUI

struct DetailSheetView: View {
    
    @Binding var photoDescription: String
    var image: Photo
    private let textFieldPadding: CGFloat = 15
    
    private let moreInfo = LocalizedStringKey("more.info")
    private let descriptionField = LocalizedStringKey("no.description.available")
    
    var body: some View {
        VStack(alignment: .center) {
            Text(image.title)
                .font(.headline)
                .bold()
                .padding()
            
            Text(moreInfo)
                .font(.subheadline)
                .padding(.leading)
            
            ScrollView {
                TextField(descriptionField,
                          text: $photoDescription,
                          axis: .vertical)
                    .font(.body)
                    .disabled(true)
                    .lineLimit(nil)
                    .padding(.init(top: 0,
                                   leading: textFieldPadding,
                                   bottom: 0,
                                   trailing: textFieldPadding))
            }
        }
    }
}
