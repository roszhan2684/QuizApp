import SwiftUI
import Combine

class QuizViewModel: ObservableObject {
    @Published private var quizBrain = QuizBrain()
    @Published var selectedAnswer: String? = nil
    @Published var isCorrect: Bool? = nil
    @Published var isFinished: Bool = false   // ✅ track quiz state
    
    var currentQuestion: String {
        quizBrain.getQuestionText()
    }
    
    var progress: Float {
        quizBrain.getProgress()
    }
    
    var score: Int {
        quizBrain.score
    }
    
    var correctAnswers: Int {
        quizBrain.correctAnswers
    }
    
    var wrongAnswers: Int {
        quizBrain.wrongAnswers
    }
    
    func getButtonColor(for answer: String) -> Color {
        if let selected = selectedAnswer {
            if answer == quizBrain.quiz[quizBrain.questionNumber].answer {
                return selected == answer ? Color.green : Color.white.opacity(0.2)
            } else if selected == answer {
                return Color.red
            }
        }
        return Color.white.opacity(0.2)
    }
    
    func checkAnswer(_ answer: String) {
        selectedAnswer = answer
        isCorrect = quizBrain.checkAnswer(answer)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let hasNext = self.quizBrain.nextQuestion()
            if !hasNext {
                self.isFinished = true  // ✅ end quiz
            }
            self.selectedAnswer = nil
            self.isCorrect = nil
            self.objectWillChange.send()
        }
    }
    
    func restartQuiz() {
        quizBrain.resetQuiz()
        isFinished = false
    }
}
