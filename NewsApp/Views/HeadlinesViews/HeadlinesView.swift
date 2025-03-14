//
//  HeadlinesView.swift
//  NewsApp
//
//  Created by Oleksiy Chebotarov on 14/03/2025.
//

import SwiftUI

enum LoadingState<T> {
    case initial
    case loading
    case loaded(T)
    case failed(Error)
}

struct HeadlinesView: View {
    @Environment(\.apiClient) private var api
    @State var loadingState: LoadingState<[HeadlineDto]> = .initial

    var body: some View {
        NavigationStack {
            Group {
                switch loadingState {
                case .initial:
                    InitialView(retryAction: fetchHeadlines)
                case .loading:
                    LoadingView(text: "Loading headlines...")
                case let .loaded(headlines):
                    List(headlines, id: \.id) { headline in
                        HeadlineRowView(headline: headline)
                    }
                case let .failed(error):
                    ErrorView(error: error, retryAction: fetchHeadlines)
                }
            }
            .onAppear {
                if case .initial = loadingState {
                    Task {
                        await fetchHeadlines()
                    }
                }
            }
            .refreshable {
                await fetchHeadlines()
            }
            .navigationTitle("Headlines")
        }
    }

    @MainActor
    func fetchHeadlines() async {
        if case .loaded = loadingState { return }

        loadingState = .loading

        do {
            let headlines = try await api.getHeadlines()
            InMemoryCache.shared.saveHeadlines(headlines)
            loadingState = .loaded(headlines)
        } catch {
            loadingState = .failed(error)
        }
    }
}

#Preview {
    HeadlinesView()
        .environment(\.apiClient, APIClientKey.defaultValue)
}
