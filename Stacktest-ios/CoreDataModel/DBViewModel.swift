//
//  DBViewModel.swift
//  Stacktest-ios
//
//  Created by СОВА on 20.06.2022.
//

import Foundation
import CoreData
import Firebase

class DBViewModel: ObservableObject {
    
    static var share = DBViewModel()
    
    @Published var selected = 0
    
    @Published var pddCategory = [ModelCategory]()
    
    @Published var generalArray = [ModelCategory]()
    @Published var arrayBool = false
    @Published var pddRossii = [ModelCategory]()
    @Published var pddEstonii = [ModelCategory]()
    @Published var pddUkraine = [ModelCategory]()
    @Published var obuchenie = [ModelCategory]()
    
    @Published var locale = ""
    var version = ""
    var rootVersion = ""
    var category = [ModelCategory]()
    var testPollis = [ModelTest]()
    var stakTest = [ModelStacktest]()
    init() {
        startGet()
        locale = UserDefaults.standard.string(forKey: "Location") ?? "ru"
    }
  
    func startGet() {
        
        FirebaseData.shared.pddBDCategory.getData(completion: { error, snapshot in
            if let error = error {
                print(error.localizedDescription)
                    return
            } else {
                guard let snapshot = snapshot else {return}
                for stnap in snapshot.children {
                    let categoryBD = ModelCategory(snapshot: stnap as! DataSnapshot, image: "")
                    if categoryBD.title == "ROOT" {
                        
                        self.rootVersion = categoryBD.version
                    }
                }
                for mCC in CoreDataManager.shared.getAllCategory() {
                    let bd = ModelCategory(modelCategoryCore: mCC)
//                    print(bd)
                    if bd.name == "predpisyvayushchie-znaki"{
                        self.version = bd.version
                    }
                }
                if self.version != self.rootVersion {
                    FirebaseData.shared.downloadPddBDCategory { result in
                        switch result {
                        case .success():
                            self.saveCategory()
                            self.getAllTCategory()
                            self.compilatorGereralArray()
                            self.pddCategoryPry()
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                } else {
                    self.getAllTCategory()
                    self.compilatorGereralArray()
                    self.pddCategoryPry()
                }
            }
        })
           
            
        
        
    }
    func getAllTCategory() {
        category.removeAll()
        testPollis.removeAll()
        stakTest.removeAll()
        for mCC in CoreDataManager.shared.getAllCategory() {
            category.append(ModelCategory(modelCategoryCore: mCC))
        }
        for mCC in CoreDataManager.shared.getAllTest() {
            testPollis.append(ModelTest(testModelCore: mCC))
        }
        print(testPollis.count)
        for mCC in CoreDataManager.shared.getAllStackeTest() {
            stakTest.append(ModelStacktest(modelStacktestCore: mCC))
        }
        print("____________\(stakTest.count)")
        
    }
    
    func saveCategory() {
        CoreDataManager.shared.deleteAllData("ModelCategoryCore")
        CoreDataManager.shared.deleteAllData("ModelTestCore")
        CoreDataManager.shared.deleteAllData("ModelStacktestCore")
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
    
    func compilatorGereralArray() {
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
        self.pddRossii = generalArray.filter {$0.id == "42" || $0.id == "16"}
        self.pddEstonii = generalArray.filter {$0.id == "44" || $0.id == "17"}
        self.pddUkraine = generalArray.filter {$0.id == "18" || $0.id == "50"}
        self.obuchenie = generalArray.filter {$0.id == "54"}
       
    }
    func pddCategoryPry() {
        
        switch locale {
        case "ru":
            pddCategory = pddRossii
            arrayBool = true
        case "uk":
            pddCategory = pddUkraine
            arrayBool = true
            
        case "en":
            pddCategory = pddEstonii
            arrayBool = true
        default:
            pddCategory = pddRossii
            arrayBool = true
        }
        for pri in self.pddCategory {
            print("\(pri.title)___ \(pri.id)")
        }
        print(locale)
    }
}

