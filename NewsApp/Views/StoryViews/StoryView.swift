//
//  StoryView.swift
//  NewsApp
//
//  Created by Oleksiy Chebotarov on 14/03/2025.
//

import Foundation
import SwiftUI

struct StoryView: View {
    @Environment(\.apiClient) private var api
    @State var loadingState: LoadingState<StoryDetailsDto> = .initial
    let storyID: StoryIdentifier

    var body: some View {
        Group {
            switch loadingState {
            case .initial:
                InitialView(retryAction: fetchStory)
            case .loading:
                LoadingView(text: "Loading Story...")
            case let .loaded(story):
                StoryContentView(story: story)
            case let .failed(error):
                ErrorView(error: error, retryAction: fetchStory)
            }
        }
        .onAppear {
            Task {
                await fetchStory()
            }
        }
        .navigationTitle("Story Details")
    }

    @MainActor
    func fetchStory() async {
        loadingState = .loading

        if let cachedStory = InMemoryCache.shared.getStory(id: storyID) {
            loadingState = .loaded(cachedStory)
            return
        }

        do {
            let fetchedStory = try await api.getStory(id: storyID)
            InMemoryCache.shared.saveStory(fetchedStory)
            loadingState = .loaded(fetchedStory)
        } catch {
            loadingState = .failed(error)
        }
    }
}
