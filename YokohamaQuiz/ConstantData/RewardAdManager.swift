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
    
    func showAd() {
        guard let topVC = RewardAdManager.topViewController() else {
            print("表示可能はない")
            return
        }
        
        if let ad = rewardedAd {
            ad.present(from: topVC) {
                let reward = ad.adReward
                print("User watched ad and earned: \(reward.amount) \(reward.type)")
                self.loadAd()
            }
        }
        else {
            print("Ad not ready.")
        }
    }
    
    static func topViewController(base: UIViewController? = UIApplication.shared.connectedScenes
        .compactMap { ($0 as? UIWindowScene)?.keyWindow }
        .first?.rootViewController) -> UIViewController? {
            
            if let nav = base as? UINavigationController {
                return topViewController(base: nav.visibleViewController)
            }
            if let tab = base as? UITabBarController {
                return topViewController(base: tab.selectedViewController)
            }
            if let presented = base?.presentedViewController {
                return topViewController(base: presented)
            }
            return base
        }
}

