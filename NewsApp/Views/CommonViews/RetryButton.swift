//
//  RetryButton.swift
//  NewsApp
//
//  Created by Oleksiy Chebotarov on 14/03/2025.
//

import SwiftUI

struct RetryButton: View {
    var action: () async -> Void

    var body: some View {
        Button("Retry") {
            Task {
                await action()
            }
        }
        .padding()
        .frame(width: 150, height: 50)
        .background(Color.blue)
        .foregroundColor(.white)
        .cornerRadius(8)
    }
}

#Preview {
    RetryButton(action: {})
}
