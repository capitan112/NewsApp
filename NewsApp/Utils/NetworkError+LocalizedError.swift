//
//  NetworkError+LocalizedError.swift
//  NewsApp
//
//  Created by Oleksiy Chebotarov on 14/03/2025.
//

import Foundation

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .failed:
            return "Oops! Something went wrong on our end. Please try again in a few moments."
        case .offline:
            return "It looks like you're offline. Please check your internet connection and try again."
        case .notFound:
            return "We couldn't find what you're looking for. It may have been moved or deleted."
        }
    }
}
