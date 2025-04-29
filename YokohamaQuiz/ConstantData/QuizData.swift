//
//  QuizData.swift
//  YokohamaQuiz
//
//  Created by 齋藤龍太 on 2025/03/17.
//

import SwiftUI


struct QuizData {
    static let yokohamaHistoryQuestions: [QuizItem] = [
        QuizItem(
            question: "横浜港が開港したのは西暦何年？",
            choices: ["1859年", "1854年", "1759年", "1959年"],
            correctAnswer: "1859年"
        ),
        QuizItem(
            question: "日本で初めて鉄道が開通した区間はどこ？",
            choices: ["品川〜横浜", "上野〜横浜", "東京〜横浜", "新橋〜横浜"],
            correctAnswer: "新橋〜横浜"
        ),
        QuizItem(
            question: "横浜は日本で初めて〇〇館が開業された。〇〇に入るものは何？",
            choices: ["映画", "写真", "美術", "博物"],
            correctAnswer: "写真"
        ),
        QuizItem(
            question: "次のうち、明治時代に税関の保税倉庫として建てられた建物はどれ?",
            choices: ["旧横浜正金銀行本店（現・神奈川県立歴史博物館）", "横浜税関", "横浜スタジアム", "横浜赤レンガ倉庫"],
            correctAnswer: "横浜赤レンガ倉庫"
        ),
        QuizItem(
            question: "1923年の関東大震災で横浜は壊滅的な被害を受けた。その際に発生した瓦礫を埋め立てに再利用した横浜市にある公園はどれ？",
            choices: ["山下公園", "港の見える丘", "三溪園", "野毛山公園"],
            correctAnswer: "山下公園"
        )
    ]
    
    static let yokohamaGourmetQuestions: [QuizItem] = [
        QuizItem(
            question: "スパゲッティ・ナポリタンの発祥とされるホテルはどこ？",
            choices: ["帝国ホテル", "ホテルニューオータニ", "ホテルオークラ", "ホテルニューグランド"],
            correctAnswer: "ホテルニューグランド"
        ),
        QuizItem(
            question: "横浜は〇〇文化の発祥地である。〇〇に入る言葉は？",
            choices: ["和食", "中華", "洋食", "韓国料理"],
            correctAnswer: "洋食"
        ),
        QuizItem(
            question: "横浜赤レンガ倉庫で開催される、グルメイベントの名前として“実在しない”ものは？",
            choices: ["横浜オクトーバーフェスト", "世界のカレー祭り", "チーズフェス", "ピザフェス"],
            correctAnswer: "ピザフェス"
        ),
        QuizItem(
            question: "家系ラーメン”発祥の店の名前は？",
            choices: ["吉田家", "横浜家", "吉村家", "八百屋"],
            correctAnswer: "吉村家"
        ),
        QuizItem(
            question: "これは横浜市のどこ？",
            questionImage: Image("Quiz_Image1"),
            choices: ["マリンタワー", "大黒ふ頭", "赤レンガ倉庫", "中華街"],
            correctAnswer: "中華街"
        )
    ]
    
    static let yokohamaAttractionsQuestions: [QuizItem] = [
        QuizItem(
            question: "「世界一高い灯台」として建てられた場所は？",
            choices: ["横浜ランドマークタワー", "横浜マリンタワー", "ベイブリッジタワー", "東京タワー"],
            correctAnswer: "横浜マリンタワー"
        ),
        QuizItem(
            question: "横浜ランドマークタワーの高さは何メートル？",
            choices: ["333メートル", "634メートル", "296メートル", "300メートル"],
            correctAnswer: "296メートル"
        ),
        QuizItem(
            question: "世界の地域ごとに動物の展示を行っている横浜市の大型動物園は",
            choices: ["金沢動物園", "上野動物園", "よこはま動物園ズーラシア", "野毛山動物園"],
            correctAnswer: "よこはま動物園ズーラシア"
        ),
        QuizItem(
            question: "日本で初めてよこはま動物園ズーラシアにて展示されたこの動物の名前は？",
            questionImage: Image("Quiz_Image2"),
            choices: ["シマウマ", "キリン", "ウマ", "オカピ"],
            correctAnswer: "オカピ"
        ),
        QuizItem(
            question: "この写真のトラは「縞模様が細かく、体が小さい」のが特徴です。このトラの名前は何？",
            questionImage: Image("Quiz_Image3"),
            choices: ["ベンガルトラ", "スマトラトラ", "タイガー" ,"トラッキー"],
            correctAnswer: "スマトラトラ"
        )
    ]
}
