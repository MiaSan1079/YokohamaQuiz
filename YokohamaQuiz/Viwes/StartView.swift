//
//  StartView.swift
//  YokohamaQuiz
//
//  Created by 齋藤龍太 on 2025/03/12.
//

import SwiftUI
import AppTrackingTransparency
import AdSupport

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
        
        .onAppear {
            // ATTリクエストをここで呼び出す
            requestTrackingPermission()
        }
    }
    
    func requestTrackingPermission() {
        if #available(iOS 14, *) {
            ATTrackingManager.requestTrackingAuthorization { status in
                switch status {
                case .authorized:
                    print("追跡が許可されました")
                case .denied:
                    print("追跡は拒否されました")
                case .notDetermined:
                    print("まだ決定されていません")
                case .restricted:
                    print("制限されています")
                @unknown default:
                    break
                }
            }
        }
    }
    
}

#Preview {
    StartView()
}
