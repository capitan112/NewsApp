//
//  NewsAppApp.swift
//  NewsApp
//
//  Created by Oleksiy Chebotarov on 14/03/2025.
//

import SwiftUI

@main
struct NewsAppApp: App {
    var body: some Scene {
        WindowGroup {
            HeadlinesView()
                .environment(\.apiClient, APIClientKey.defaultValue)
        }
    }
}
