import SwiftUI

struct WelcomeView: View {
    var startAction: () -> Void
    @State private var isPressed = false

    var body: some View {
        ZStack {
            // Background gradient
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

            VStack(spacing: 50) {
                Spacer()

                Text("Welcome")
                    .font(.system(size: 30, weight: .heavy, design: .rounded))
                    .foregroundColor(.yellow)
                    .shadow(color: .black.opacity(0.8), radius: 10, x: 0, y: 6)
                
                Text("To")
                    .font(.system(size: 20, weight: .heavy, design: .rounded))
                    .foregroundColor(.yellow)
                    .shadow(color: .black.opacity(0.8), radius: 10, x: 0, y: 6)


                Text("Quizzler")
                    .font(.system(size: 50, weight: .heavy, design: .rounded))
                    .foregroundColor(.yellow)
                    .shadow(color: .black.opacity(0.8), radius: 10, x: 0, y: 6)

                Spacer()

                // Start Button
                Button(action: {
                    withAnimation {
                        startAction()
                    }
                }) {
                    Text("Start Quiz")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.horizontal, 60)
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
                        .scaleEffect(isPressed ? 1.05 : 1.0)
                }
                .onLongPressGesture(minimumDuration: .infinity, pressing: { pressing in
                    withAnimation(.spring()) {
                        isPressed = pressing
                    }
                }, perform: {})

                Spacer()
            }
            .padding()
        }
    }
}
