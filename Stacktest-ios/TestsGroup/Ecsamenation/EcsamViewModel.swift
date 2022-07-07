//
//  EcsamViewModel.swift
//  Stacktest-ios
//
//  Created by СОВА on 07.07.2022.
//

import SwiftUI

class EcsamViewModel: ObservableObject {
    
    @Published var tests = [ModelQuestion]()
    @Published var testExsame = [ModelQuestion]()
    var category: ModelCategory?
    
    init(category: ModelCategory?) {
        self.category = category
    }
    
    func questionFor() {
        guard let testcat = category?.test else {return}
        for test in testcat {
            for _ in test.question {
                var count = 0
                let test = ModelQuestion(title: test.title, question: test.question[count], answer1: test.answer1[count], answer2: test.answer2[count], answer3: test.answer3[count], answer4: test.answer4[count], correct: test.correct[count], img: test.img[count])
                self.tests.append(test)
                count += 1
            }
        }
        if self.tests.count >= 22 {
            let exam = self.tests.shuffled()
            for i in exam[1...20] {
                testExsame.append(i)
            }
            print(testExsame.count)
        }
    }
    
}


