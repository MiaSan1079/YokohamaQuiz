//
//  StartView.swift
//  YokohamaQuiz
//
//  Created by 齋藤龍太 on 2025/03/12.
//

import SwiftUI

struct StartView: View {
    @State var isShowingGenreSelectionView = false
    
    @StateObject private var adManager = RewardAdManager()
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Text("横浜\nクイズ!")
                    .font(.system(size: 70).bold())
                    .foregroundStyle(.originalYokohamaGold)
                    .stroke(color: .originalGreen, width: 5)
                Spacer()
                Button {
                    isShowingGenreSelectionView = true
                } label: {
                    Image(systemName: "arrowtriangle.right.circle.fill")
                    Text("スタート")
                        .font(.system(size: 70).bold())
                        .foregroundStyle(.originalYokohamaGold)
                        .stroke(color: .originalYokohamaGreen, width: 5)
                }
                .buttonStyle(.borderedProminent)
                .tint(.originalYokohamaGreen)
                .fullScreenCover(isPresented: $isShowingGenreSelectionView) {
                    GenreSelectionView(adManager: adManager)
                }
            }
            Spacer()
        }
        .background(
            Image("background_image")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(.all)
        )
        
    }
}

#Preview {
    StartView()
}
