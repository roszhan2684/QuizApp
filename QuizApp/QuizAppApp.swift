//
//  QuizAppApp 2.swift
//  QuizApp
//
//  Created by ROSZHAN RAJ on 24/09/25.
//


//
//  QuizAppApp.swift
//  QuizApp
//
//  Created by ROSZHAN RAJ on 22/09/25.
//

import SwiftUI

@main
struct QuizAppApp: App {
    @StateObject var viewModel = QuizViewModel()  // ✅ create once

    var body: some Scene {
        WindowGroup {
            RootView()   // ✅ shows Welcome or Quiz
                .environmentObject(viewModel) // ✅ inject globally
        }
    }
}
