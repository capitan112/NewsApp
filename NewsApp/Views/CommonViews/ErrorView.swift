//
//  ErrorView.swift
//  NewsApp
//
//  Created by Oleksiy Chebotarov on 14/03/2025.
//

import SwiftUI

struct ErrorView: View {
    let error: Error
    let retryAction: () async -> Void

    var body: some View {
        VStack {
            Text(error.localizedDescription)
                .foregroundColor(.red)
                .multilineTextAlignment(.center)
                .padding()

            RetryButton {
                await retryAction()
            }
        }
    }
}
