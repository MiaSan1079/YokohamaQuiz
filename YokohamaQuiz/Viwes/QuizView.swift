//
//  QuizView.swift
//  YokohamaQuiz
//
//  Created by 齋藤龍太 on 2025/03/12.
//

import SwiftUI
struct QuizView: View {
    
    @ObservedObject var adManager: RewardAdManager
    
    @State var isShowingScoreView = false
    @State var isShowingResultSymbol = false
    @State var isAnswerCorrect = false
    @State var currentQuizIndex = 0
    @State var correctCount = 0
    
    @Binding var quizItems: [QuizItem]
    
    
    var body: some View {
        ZStack {
            VStack {
                //                問題番号
                Text("問題番号: \(currentQuizIndex + 1)/\(quizItems.count)")
                    .font(.headline)
                    .padding(10)
                    .background(Color.originalYokohamaGreen)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
//                問題
                VStack {
                    Text(quizItems[currentQuizIndex].question)
                        .font(.title2)
                    quizItems[currentQuizIndex].questionImage?
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(
                    Color.originalYokohamaGold
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.originalGreen, lineWidth: 5)
                )
                .frame(maxHeight: .infinity)
//                選択肢
                ForEach(quizItems[currentQuizIndex].choices, id: \.self) { choice in
                    Button() {
                        if choice == quizItems[currentQuizIndex].correctAnswer {
                            isAnswerCorrect = true
                            correctCount += 1
                        } else {
                            isAnswerCorrect = false
                        }
                        isShowingResultSymbol = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            isShowingResultSymbol = false
                            if currentQuizIndex + 1 >= quizItems.count {
                                isShowingScoreView = true
                                return
                            }
                            currentQuizIndex += 1
                        }
                    } label: {
                        Text(choice)
                            .font(.title.bold())
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.originalYokohamaGreen)
                            .foregroundStyle(.originalYokohamaGold)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .fullScreenCover(isPresented: $isShowingScoreView) {
                        ScoreView(adManager: adManager, scoreText: "\(quizItems.count)問中\(correctCount)問正解")
                    }
                }
            }
            .padding()
            if isShowingResultSymbol {
                Text(isAnswerCorrect ? "○" : "×")
                    .font(.system(size: 1000))
                    .minimumScaleFactor(0.1)
                    .foregroundStyle(isAnswerCorrect ? .green : .red)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.5))
            }
        }
        .background(
            Image("background_image3")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
        )
    }
}

//#Preview {
//    QuizView(quizItems: .constant(QuizData.yokohamaHistoryQuestions))
//}
