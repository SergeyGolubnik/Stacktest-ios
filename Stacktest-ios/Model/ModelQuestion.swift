//
//  ModelQuestion.swift
//  Stacktest-ios
//
//  Created by СОВА on 07.07.2022.
//

import Foundation


struct ModelQuestion: Identifiable, Hashable {
    var id = UUID().uuidString
    var title: String
    var question: String
    var answer1: String
    var answer2: String
    var answer3: String
    var answer4: String
    var correct: String
    var img: String
    var otvet: Bool?
    init(
         title: String,
         question: String,
         answer1: String,
         answer2: String,
         answer3: String,
         answer4: String,
         correct: String,
         img: String) {
        self.title = title
        self.question = question
        self.answer1 = answer1
        self.answer2 = answer2
        self.answer3 = answer3
        self.answer4 = answer4
        self.correct = correct
        self.img = img
    }
}
