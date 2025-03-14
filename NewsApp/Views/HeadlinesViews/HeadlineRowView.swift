//
//  HeadlineRowView.swift
//  NewsApp
//
//  Created by Oleksiy Chebotarov on 14/03/2025.
//

import SwiftUI

struct HeadlineRowView: View {
    let headline: HeadlineDto

    var body: some View {
        NavigationLink(destination: StoryView(storyID: headline.id)) {
            VStack(alignment: .leading) {
                Text(headline.title)
                    .font(.headline)
                Text(headline.author)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}
