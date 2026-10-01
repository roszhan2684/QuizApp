import SwiftUI

struct RootView: View {
    @State private var showQuiz = false
    @EnvironmentObject var viewModel: QuizViewModel

    var body: some View {
        if showQuiz {
            if viewModel.isFinished {
                ResultView {
                    showQuiz = false // back to Welcome
                }
            } else {
                ContentView()
            }
        } else {
            WelcomeView {
                withAnimation(.easeInOut) {
                    showQuiz = true
                }
            }
        }
    }
}
