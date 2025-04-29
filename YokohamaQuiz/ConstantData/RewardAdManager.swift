//
//  RewardAdManager.swift
//  YokohamaQuiz
//
//  Created by 齋藤龍太 on 2025/04/26.
//

import GoogleMobileAds
import SwiftUI

class RewardAdManager: NSObject, ObservableObject, FullScreenContentDelegate {
    @Published var rewardedAd: RewardedAd?
    
    override init() {
        super.init()
        loadAd()
    }
    
    func loadAd() {
        let request = Request()
        RewardedAd.load(with: "ca-app-pub-3940256099942544/1712485313", request: request) { ad, error in
            if let error = error {
                print("Failed to load rewarded ad: \(error.localizedDescription)")
                return
            }
            self.rewardedAd = ad
            self.rewardedAd?.fullScreenContentDelegate = self
            print("Rewarded ad loaded.")
        }
    }
    
    func showAd(from root: UIViewController) {
        if let ad = rewardedAd {
            ad.present(from: root) {
                let reward = ad.adReward
                print("User watched ad and earned: \(reward.amount) \(reward.type)")
            }
        } else {
            print("Ad not ready.")
        }
    }
}

