//
//  import SwiftUI.swift
//  NewsApp
//
//  Created by Oleksiy Chebotarov on 14/03/2025.
//

import SwiftUI

struct LoadingView: View {
    let text: String

    var body: some View {
        VStack {
            ProgressView()
            Text(text)
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.top, 8)
        }
    }
}
