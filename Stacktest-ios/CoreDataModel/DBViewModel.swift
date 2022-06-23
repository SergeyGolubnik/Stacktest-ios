//
//  DBViewModel.swift
//  Stacktest-ios
//
//  Created by СОВА on 20.06.2022.
//

import Foundation
import CoreData

class DBViewModel {
    
    static var share = DBViewModel()
    
    var generalArray = [ModelCategory]()
    var version = ""
    var category = [ModelCategory]()
    var testPollis = [ModelTest]()
    var stakTest = [ModelStacktest]()
    
    func getAllTCategory() {
        category.removeAll()
        for mCC in CoreDataManager.shared.getAllCategory() {
            if mCC.title == "ROOT"{
                version = mCC.version ?? ""
            }
            category.append(ModelCategory(modelCategoryCore: mCC))
            
        }
        getAllTest()
    }
    func getAllTest() {
        testPollis.removeAll()
        for mCC in CoreDataManager.shared.getAllTest() {
            testPollis.append(ModelTest(testModelCore: mCC))
        }
        print(testPollis.count)
        getAllStackTest()
    }
    func getAllStackTest() {
        stakTest.removeAll()
        for mCC in CoreDataManager.shared.getAllStackeTest() {
            stakTest.append(ModelStacktest(modelStacktestCore: mCC))
        }
        print("____________\(stakTest.count)")
        self.compilatorArray()
    }
    
    func saveCategory() {
        CoreDataManager.shared.deleteAllData("ModelCategoryCore")
            for categ in FirebaseData.shared.category {
                let category = ModelCategoryCore(context: CoreDataManager.shared.viewContext)
                category.id = categ.id
                category.parentId = categ.parentId
                category.alias = categ.alias
                category.name = categ.name
                category.image = categ.image
                category.title = categ.title
                category.version = categ.version
                CoreDataManager.shared.save()
            }
        saveTest()
    }
    func saveTest() {
        CoreDataManager.shared.deleteAllData("ModelTestCore")
            for test in FirebaseData.shared.testPollis {
                let testIn = ModelTestCore(context: CoreDataManager.shared.viewContext)
                testIn.id = test.id
                testIn.name = test.name
                testIn.img = test.img
                testIn.title = test.title
                testIn.category = test.category
                testIn.correct = test.correct
                testIn.question = test.question
                testIn.answer1 = test.answer1
                testIn.answer2 = test.answer2
                testIn.answer3 = test.answer3
                testIn.answer4 = test.answer4
                CoreDataManager.shared.save()
            }
        saveStackTest()
    }
    func saveStackTest() {
        CoreDataManager.shared.deleteAllData("ModelStacktestCore")
            for stackTest in FirebaseData.shared.stakTest {
                let stack = ModelStacktestCore(context: CoreDataManager.shared.viewContext)
                stack.id = stackTest.id
                stack.name = stackTest.name
                stack.title = stackTest.title
                stack.category = stackTest.category
                stack.imageLink = stackTest.imageLink
                stack.imgRek = stackTest.imgRek
                stack.img = stackTest.img
                stack.imgb = stackTest.imgb
                stack.vopros = stackTest.vopros
                stack.otwet = stackTest.otwet
                CoreDataManager.shared.save()
            }
    }
    func compilatorArray() {
        let categoryOne = category.filter {$0.parentId == "1"}
        let categoryTwo = category.filter {$0.parentId != "1"}
        var categoryOneTestStack = [ModelCategory]()
        var categoryTwoTestStack = [ModelCategory]()
        var generalArray = [ModelCategory]()
        for category1 in categoryOne {
            var cat = category1
            for test in testPollis {
                if category1.id == test.category {
                    cat.test.append(test)
                    
                }
            }
            for stack in stakTest {
                if category1.id == stack.category {
                    cat.stackTest.append(stack)
                }
            }
            
            categoryOneTestStack.append(cat)
            
        }
        for category2 in categoryTwo {
            var cat = category2
            for test in testPollis {
                if category2.id == test.category {
                    cat.test.append(test)
                }
            }
            for stack in stakTest {
                if category2.id == stack.category {
                    cat.stackTest.append(stack)
                }
            }
            categoryTwoTestStack.append(cat)
        }
        for garray in categoryOneTestStack {
            var groupArray = garray
            for grop in categoryTwoTestStack {
                if garray.id == grop.parentId {
                    groupArray.modelCategory.append(grop)
                }
            }
            generalArray.append(groupArray)
        }
        self.generalArray = generalArray
    }
}

