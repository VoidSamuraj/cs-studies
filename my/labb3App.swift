//
//  labb3App.swift
//  labb3
//
//  Created by student on 22/03/2026.
//

import SwiftUI

@main
struct labb3App: App {
    @StateObject var viewModel :MemoGameViewModel = MemoGameViewModel();
    var body: some Scene {
        WindowGroup {
            ContentView(memoViewModel: viewModel)
        }
    }
}
