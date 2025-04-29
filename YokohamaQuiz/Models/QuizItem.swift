//
//  QuizItem.swift
//  YokohamaQuiz
//
//  Created by 齋藤龍太 on 2025/03/20.
//

import SwiftUI

struct QuizItem {
    let question: String
    var questionImage: Image? = nil
    var choices: [String]
    let correctAnswer: String
}
