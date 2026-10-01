//
//  QuizBrain.swift
//  QuizApp
//
//  Created by ROSZHAN RAJ on 24/09/25.
//

import Foundation

struct QuizBrain {
    let quiz = [
        Question(q: "The Earth revolves around the Sun", a: "True"),
        Question(q: "Water boils at 100 degrees Celsius at sea level", a: "True"),
        Question(q: "The capital of France is London", a: "False"),
        Question(q: "Mount Everest is the tallest mountain in the world", a: "True"),
        Question(q: "The chemical symbol for gold is Go", a: "False"),
        Question(q: "Oxygen is the most abundant element in Earth's crust", a: "False"),
        Question(q: "The currency of Japan is the Yen", a: "True"),
        Question(q: "The Nile River is the longest river in the world", a: "True"),
        Question(q: "The human body has 206 bones", a: "False")
    ]
    
    var questionNumber = 0
    var score = 0
    var correctAnswers = 0
    var wrongAnswers = 0
    
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    func getProgress() -> Float {
        return Float(questionNumber + 1) / Float(quiz.count)
    }
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        let correct = userAnswer == quiz[questionNumber].answer
        if correct {
            score += 1
            correctAnswers += 1
        } else {
            wrongAnswers += 1
        }
        return correct
    }
    
    /// Returns true if there is another question, false if quiz is finished
    mutating func nextQuestion() -> Bool {
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
            return true
        } else {
            return false // ✅ stop instead of looping
        }
    }
    
    mutating func resetQuiz() {
        questionNumber = 0
        score = 0
        correctAnswers = 0
        wrongAnswers = 0
    }
}
