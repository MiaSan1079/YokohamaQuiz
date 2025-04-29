//
//  GenreSelectionView.swift
//  YokohamaQuiz
//
//  Created by 齋藤龍太 on 2025/03/17.
//

import SwiftUI

struct GenreSelectionView: View {
    
    @State var isshowingQuizView = false
    @State var selectedQuizData: [QuizItem] = []
    
    var body: some View {
        ZStack {
            Image("background_image3")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(.all)
            VStack {
                Spacer()
                Button {
                    selectedQuizData = QuizData.yokohamaHistoryQuestions
                    isshowingQuizView = true
                } label: {
                    Text("横浜歴史クイズ")
                        .font(.title.bold())
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.originalYokohamaGreen)
                        .foregroundStyle(.originalYokohamaGold)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                Button {
                    selectedQuizData = QuizData.yokohamaGourmetQuestions
                    isshowingQuizView = true
                } label: {
                    Text("横浜グルメクイズ")
                        .font(.title.bold())
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.originalYokohamaGreen)
                        .foregroundStyle(.originalYokohamaGold)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                Button {
                    selectedQuizData = QuizData.yokohamaAttractionsQuestions
                    isshowingQuizView = true
                } label: {
                    Text("横浜名所クイズ")
                        .font(.title.bold())
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.originalYokohamaGreen)
                        .foregroundStyle(.originalYokohamaGold)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                Spacer()
            }
        }
        .fullScreenCover(isPresented: $isshowingQuizView) {
            QuizView(quizItems: $selectedQuizData)
        }
    }
}

#Preview {
    GenreSelectionView()
}
