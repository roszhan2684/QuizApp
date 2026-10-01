//
//  ContentView.swift
//  QuizApp
//
//  Created by ROSZHAN RAJ on 22/09/25.
//

import SwiftUI
import Combine

struct ContentView: View {
    @EnvironmentObject var viewModel: QuizViewModel   // ✅ use shared ViewModel

    var body: some View {
        ZStack {
            // ✅ Background color (gradient)
            RadialGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.3, green: 0.2, blue: 0.3),
                    Color(red: 0.7, green: 0.6, blue: 0.8)
                ]),
                center: .center,
                startRadius: 30,
                endRadius: 500
            )
            .ignoresSafeArea()

            VStack {
                // ✅ Score label (top-left)
                HStack {
                    Text("Score: \(viewModel.score)")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.leading, 20)
                        .padding(.top, 10)
                    Spacer()
                }

                Spacer(minLength: 20)
                
                // ✅ App Heading
                Text("Quizzler")
                    .font(.system(size: 50, weight: .heavy, design: .rounded))
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.8), radius: 6, x: 0, y: 4)
                    .padding(.bottom, 50)
                
                // ✅ Question Card
                QuestionCard(question: viewModel.currentQuestion)
                
                Spacer()
                
                // ✅ Answer Buttons
                VStack(spacing: 20) {
                    AnswerButton(
                        text: "True",
                        backgroundColor: viewModel.getButtonColor(for: "True")
                    ) {
                        viewModel.checkAnswer("True")
                    }
                    
                    AnswerButton(
                        text: "False",
                        backgroundColor: viewModel.getButtonColor(for: "False")
                    ) {
                        viewModel.checkAnswer("False")
                    }
                }
                .padding(.horizontal, 40)
                
                // ✅ Progress Bar
                ProgressView(value: viewModel.progress, total: 1.0)
                    .progressViewStyle(LinearProgressViewStyle(tint: .yellow))
                    .frame(width: 250)
                    .padding()
                
                Spacer()
            }
            .padding()
        }
    }
}

// ✅ Question Card with depth + hover effect
struct QuestionCard: View {
    var question: String
    @State private var isPressed = false

    var body: some View {
        Text(question)
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 40)
            .padding(.vertical, 20)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.black.opacity(0.3))
                    .shadow(color: .black.opacity(0.6), radius: 10, x: 0, y: 6) // depth
            )
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.black.opacity(0.8), lineWidth: 2)
                    .shadow(color: .yellow.opacity(0.7), radius: 10) // glow
            )
            .scaleEffect(isPressed ? 1.05 : 1.0) // hover effect
            .animation(.spring(response: 0.3, dampingFraction: 0.5), value: isPressed)
            .onTapGesture {
                withAnimation {
                    isPressed.toggle()
                }
            }
    }
}

// ✅ Reusable Answer Button
struct AnswerButton: View {
    var text: String
    var backgroundColor: Color
    var action: () -> Void
    
    var body: some View {
        Button(action: { withAnimation { action() } }) {
            Text(text)
                .font(.title2)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity)
                .padding()
                .background(backgroundColor)
                .foregroundColor(.white)
                .cornerRadius(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.white.opacity(0.5), lineWidth: 1)
                )
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(QuizViewModel()) // ✅ inject for preview
}
