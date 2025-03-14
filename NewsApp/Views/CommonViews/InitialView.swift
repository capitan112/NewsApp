//
//  InitialView.swift
//  NewsApp
//
//  Created by Oleksiy Chebotarov on 14/03/2025.
//

import SwiftUI

struct InitialView: View {
    let retryAction: () async -> Void

    var body: some View {
        VStack {
            Text("No data loaded")
                .foregroundColor(.red)
                .multilineTextAlignment(.center)
                .padding()

            RetryButton {
                await retryAction()
            }
        }
    }
}
