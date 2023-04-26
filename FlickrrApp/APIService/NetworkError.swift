//
//  NetworkError.swift
//  FlickrrApp
//
//  Created by Manikanta Sirumalla on 07/02/23.
//

import Foundation
import SwiftUI

enum NetworkError: LocalizedError {
    case invalidURL
    case networkFailure
    case invalidData
    case noData
    case custom(error: Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "URL isn't Valid"
        case .networkFailure:
            return "NO internet Connection"
        case .invalidData:
            return "Response data is invalid"
        case .noData:
            return "No data Available"
        case .custom(let err):
            return "Something went wrong \(err.localizedDescription)"
        }
    }
}
