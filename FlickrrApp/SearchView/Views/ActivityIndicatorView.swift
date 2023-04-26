//
//  ActivityIndicatorView.swift
//  FlickrrApp
//
//  Created by Manikanta Sirumalla on 08/02/23.
//
import SwiftUI

struct ActivityIndicatorView: View {
    
    @Binding var isLoading: Bool
    
    private let frameWidth: CGFloat = 100
    private let frameHeight: CGFloat = 100
    private let spinnerSize: CGFloat = 2
    private let frameCornerRadius: CGFloat = 20
    
    var body: some View {
        ZStack {
            Color(.systemGray4)
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .black))
                .scaleEffect(spinnerSize)
        }
        .frame(width: frameWidth, height: frameHeight, alignment: .center)
        .cornerRadius(frameCornerRadius)
    }
}
