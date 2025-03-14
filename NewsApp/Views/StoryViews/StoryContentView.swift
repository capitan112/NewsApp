//
//  StoryContentView.swift
//  NewsApp
//
//  Created by Oleksiy Chebotarov on 14/03/2025.
//

import SwiftUI

struct StoryContentView: View {
    let story: StoryDetailsDto

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(story.title)
                    .font(.title)
                    .bold()
                Text("By \(story.author)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                let formattedPublicationDate = Date(timeIntervalSince1970: story.publicationDate.timeIntervalSince1970 / 1000)
                Text("Published: \(formattedPublicationDate.formatted(.dateTime.year().month().day().hour().minute()))")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                Divider()
                Text(story.content)
                    .font(.body)
            }
            .padding()
        }
    }
}
