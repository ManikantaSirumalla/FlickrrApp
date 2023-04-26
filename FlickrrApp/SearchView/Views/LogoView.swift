//
//  LogoView.swift
//  FlickrrApp
//
//  Created by Manikanta Sirumalla on 09/02/23.
//

import SwiftUI

struct LogoView: View {
    
    private let logoOpacity: CGFloat = 0.7
    
    var body: some View {
        Image("logo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .opacity(logoOpacity)
    }
}
