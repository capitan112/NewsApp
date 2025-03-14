//
//  APIClientKey.swift
//  NewsApp
//
//  Created by Oleksiy Chebotarov on 14/03/2025.
//

import Foundation
import SwiftUI

struct APIClientKey: EnvironmentKey {
    static let defaultValue: APIClientProtocol = APIClientBuilder().makeAPIClient()
}

extension EnvironmentValues {
    var apiClient: APIClientProtocol {
        get { self[APIClientKey.self] }
        set { self[APIClientKey.self] = newValue }
    }
}
