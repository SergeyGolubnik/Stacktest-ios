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
    
    var category = [ModelCategory]()
    var testPollis = [ModelTest]()
    var stakTest = [ModelStacktest]()
    
    func getAllTCategory() {
        for mCC in CoreDataManager.shared.getAllCategory() {
            category.append(ModelCategory(modelCategoryCore: mCC))
        }
    }
    func getAllTest() {
        for mCC in CoreDataManager.shared.getAllTest() {
            testPollis.append(ModelTest(testModelCore: mCC))
        }
    }
   
    
    func save() {
        if FirebaseData.shared.category.isEmpty {
            for categ in FirebaseData.shared.category {
                let category = ModelCategoryCore(context: CoreDataManager.shared.viewContext)
                category.id = categ.id
                category.parentId = categ.parentId
                category.alias = categ.alias
                category.name = categ.name
                category.image = categ.image
                category.title = categ.title
                CoreDataManager.shared.save()
            }
        }
        if FirebaseData.shared.testPollis.isEmpty {
            for test in FirebaseData.shared.testPollis {
                let testIn = ModelTestCore(context: CoreDataManager.shared.viewContext)
                testIn.id = test.id
                
            }
        }
        
    }
    
}

