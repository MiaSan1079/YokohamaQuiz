//
//  ScoreView.swift
//  YokohamaQuiz
//
//  Created by 齋藤龍太 on 2025/03/12.
//

import SwiftUI
import GoogleMobileAds


struct ScoreView: View {
    
    @StateObject private var adManager = RewardAdManager()
    
    let scoreText: String
    
    var body: some View {
        ZStack {
            Image("background_image")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(.all)
            VStack {
                Spacer()
                Text(scoreText)
                    .font(.system(size: 50).bold())
                    .foregroundStyle(.originalYokohamaGreen)
                    .stroke(color: .originalYokohamaGold, width: 5)
                Button("広告を見てみる") {
                    if let rootVC = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                       let viewController = rootVC.windows.first?.rootViewController {
                        adManager.showAd(from: viewController)
                    }
                }
                .disabled(adManager.rewardedAd == nil)
                .buttonStyle(.borderedProminent)
                .tint(.originalYokohamaGreen)
                Button {
                    let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
                    windowScene?.windows.first?.rootViewController?.dismiss(animated: true)
                } label: {
                    Image(systemName: "arrowtriangle.right.circle.fill")
                        .font(.system(size: 50).bold())
                        .foregroundStyle(.originalYokohamaGold)
                        .stroke(color: .originalGreen, width: 5)
                    Text("スコアへ")
                        .font(.system(size: 50).bold())
                        .foregroundStyle(.originalYokohamaGold)
                        .stroke(color: .originalGreen, width: 5)
                }
                .buttonStyle(.borderedProminent)
                .tint(.originalYokohamaGreen)
                Spacer()
            }
        }
    }
}

#Preview {
    ScoreView(scoreText: "")
}

