//
//  InMemoryCache.swift
//  NewsApp
//
//  Created by Oleksiy Chebotarov on 14/03/2025.
//

import Foundation

class InMemoryCache {
    static let shared = InMemoryCache()

    private var headlinesCache: [HeadlineDto] = []
    private var storiesCache: [StoryIdentifier: StoryDetailsDto] = [:]

    func saveHeadlines(_ headlines: [HeadlineDto]) {
        headlinesCache = headlines
    }

    func getHeadlines() -> [HeadlineDto] {
        return headlinesCache
    }

    func saveStory(_ story: StoryDetailsDto) {
        storiesCache[story.id] = story
    }

    func getStory(id: StoryIdentifier) -> StoryDetailsDto? {
        return storiesCache[id]
    }
}
