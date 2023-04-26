//
//  DescriptionModel.swift
//  FlickrrApp
//
//  Created by Manikanta Sirumalla on 08/02/23.
//
import Foundation

struct DescriptionModel: Decodable {
    let photo: PictureDetails
    let stat: String
}

struct PictureDetails: Decodable {
    let description: Description
}

struct Description: Decodable {
    let _content: String
}
