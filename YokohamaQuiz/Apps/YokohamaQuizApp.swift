//
//  YokohamaQuizApp.swift
//  YokohamaQuiz
//
//  Created by 齋藤龍太 on 2025/03/12.
//

import SwiftUI
import GoogleMobileAds


@main
struct YokohamaQuizApp: App {
    
    init() {
        MobileAds.shared.start(completionHandler: {_ in })
    }
    
    var body: some Scene {
        WindowGroup {
            StartView()
        }
    }
}
