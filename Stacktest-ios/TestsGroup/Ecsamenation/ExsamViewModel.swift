//
//  EcsamViewModel.swift
//  Stacktest-ios
//
//  Created by СОВА on 07.07.2022.
//

import SwiftUI

class ExsamViewModel: ObservableObject {
    
    @Published var tests = [ModelQuestion]()
    @Published var title = ""
    
    @Published var testExsame = [ModelQuestion]()
    @Published var testExsameDable = [ModelQuestion]()
    var category: ModelCategory?
    var optionView: Int?
    init(category: ModelCategory?, optonView: Int?) {
        self.category = category
        self.optionView = optonView
    }
    
    func questionFor() {
        testExsame.removeAll()
        testExsameDable.removeAll()
        guard let testcat = category?.test else {return}
        for test in testcat {
            for _ in test.question {
                var count = 0
                let test = ModelQuestion(title: test.title, question: test.question[count], answer1: test.answer1[count], answer2: test.answer2[count], answer3: test.answer3[count], answer4: test.answer4[count], correct: test.correct[count], img: test.img[count])
                self.tests.append(test)
                count += 1
            }
        }
        if self.tests.count >= 20 {
            let exam = self.tests.shuffled()
            for i in exam[0...19] {
                testExsame.append(i)
            }
        testExsameDable = testExsame
        }
    }
    func getIndex(testEx: ModelQuestion, testArray: [ModelQuestion])->Int{
        
        let index = testArray.firstIndex(where: { test in
            return testEx.id == test.id
        }) ?? 0
        
        return index
    }
    func removeTest() {
        
    }
}


