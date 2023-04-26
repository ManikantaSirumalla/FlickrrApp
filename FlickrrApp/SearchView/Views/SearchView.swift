//
//  SearchView.swift
//  FlickrrApp
//
//  Created by Manikanta Sirumalla on 08/02/23.


import SwiftUI

struct SearchView: View {
    
    @StateObject var searchVM = SearchViewModel()
    @StateObject var debouncedText = SearchTextDebounce()
    @State private var selectedPhoto: Photo?
    
    private let prompt = LocalizedStringKey("search.photos.here")
    private let alertTitle =  LocalizedStringKey("cannot.fetch.photos")
    private let navBarTitle = LocalizedStringKey("flickrr.photos")
    
    var body: some View {
        NavigationView {
            ZStack{
                if !searchVM.isLoading {
                    LogoView()
                }
                else {
                    ActivityIndicatorView(isLoading: $searchVM.isLoading)
                }
                PhotoCollectionView(selectedPhoto: $selectedPhoto, photos: searchVM.photos)
            }
            .searchable(text: $debouncedText.text, prompt: prompt)
            .onChange(of: debouncedText.debouncedText) { searchTerm in
                    if !searchTerm.isEmpty  {
                        searchVM.performPhotoSearch(with: searchTerm)
                    } else {
                        searchVM.clearSearch()
                    }
            }
            .alert(isPresented: $searchVM.hasError) {
                showErrorAlert(title: alertTitle, error: searchVM.error!)
            }
            .navigationBarTitle(navBarTitle)
        }
        .sheet(item: $selectedPhoto) { photo in
            DetailView(image: photo)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
