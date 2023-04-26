//
//  PhotoModel.swift
//  FlickrrApp
//
//  Created by Manikanta Sirumalla on 08/02/23.
//
import Foundation

struct PhotoModel: Decodable {
    let photos: Photos
    let  stat: String
}

struct Photos: Decodable {
    let page: Int
    let pages: Int
    let perpage: Int
    let total: Int
    let photo: [Photo]
}

struct Photo: Decodable, Identifiable {
    let id: String
    let owner: String
    let secret: String
    let server: String
    let title: String
    var url: String {
        "https://live.staticflickr.com/\(server)/\(id)_\(secret)_w.jpg"
    }
}
