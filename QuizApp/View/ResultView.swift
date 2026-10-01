//
//  ResultView.swift
//  QuizApp
//
//  Created by ROSZHAN RAJ on 24/09/25.
//

import SwiftUI

struct ResultView: View {
    @EnvironmentObject var viewModel: QuizViewModel
    var restartAction: () -> Void
    
    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.2, green: 0.1, blue: 0.4),
                    Color(red: 0.7, green: 0.5, blue: 0.9)
                ]),
                center: .center,
                startRadius: 30,
                endRadius: 500
            )
            .ignoresSafeArea()
            
            VStack(spacing: 30) {
                Text("Quiz Finished!")
                    .font(.system(size: 40, weight: .heavy, design: .rounded))
                    .foregroundColor(.yellow)
                    .shadow(color: .black.opacity(0.8), radius: 10)
                
                Text("Score: \(viewModel.score)")
                    .font(.title)
                    .foregroundColor(.white)
                
                Text("✅ Correct: \(viewModel.correctAnswers)")
                    .font(.title2)
                    .foregroundColor(.green)
                
                Text("❌ Wrong: \(viewModel.wrongAnswers)")
                    .font(.title2)
                    .foregroundColor(.red)
                
                Spacer().frame(height: 40)
                
                Button(action: {
                    withAnimation {
                        viewModel.restartQuiz()
                        restartAction()
                    }
                }) {
                    Text("Restart Quiz")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.horizontal, 50)
                        .padding(.vertical, 20)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.blue)
                                .shadow(color: .black.opacity(0.6), radius: 10, x: 0, y: 6)
                        )
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white.opacity(0.5), lineWidth: 2)
                                .shadow(color: .blue.opacity(0.7), radius: 10)
                        )
                }
            }
            .padding()
        }
    }
}
