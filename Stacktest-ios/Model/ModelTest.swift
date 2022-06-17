//
//  ModelTest.swift
//  Stacktest-ios
//
//  Created by СОВА on 16.06.2022.
//

import Foundation
import Firebase

struct ModelTest {
    var id: String
    var name: String
    var title: String
    var category: String
    var question: [String]
    var answer1: [String]
    var answer2: [String]
    var answer3: [String]
    var answer4: [String]
    var correct: [String]
    var img: [String]
    
    init(snapshot: DataSnapshot, question: [String], answer1: [String], answer2: [String], answer3: [String], answer4: [String], correct: [String], img: [String]) {
        let snapshotValio = snapshot.value as! [String: Any]
        id = snapshotValio["id"] as! String
        name = snapshotValio["alias"] as! String
        title = snapshotValio["title"] as! String
        category = snapshotValio["categoty"] as! String
        
        self.question = question
        self.answer1 = answer1
        self.answer2 = answer2
        self.answer3 = answer3
        self.answer4 = answer4
        self.correct = correct
        self.img = img
    }
}
