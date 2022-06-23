//
//  FirebaseData.swift
//  Stacktest-ios
//
//  Created by СОВА on 15.06.2022.
//

import Foundation
import Firebase


class FirebaseData {
    
    
    static var shared = FirebaseData()
    
    
    var root: ModelCategory!
    var category = [ModelCategory]()
    var testPollis = [ModelTest]()
    var stakTest = [ModelStacktest]()
    
    
    let pddBDCategory = Database.database().reference(withPath: "PDD-BD").child("test-category").child("t8rv0_category")
    let pddBDPollis = Database.database().reference(withPath: "PDD-BD").child("test-polls").child("t8rv0_stacktest_polls")
    let pddBDStacktest = Database.database().reference(withPath: "PDD-BD").child("test-stacktest").child("t8rv0_stacktest_tests")
    
    func startGet() {
        pddBDCategory.observe(.value) { snapshot in
            
            for categ in snapshot.children {
                let categoryBD = ModelCategory(snapshot: categ as! DataSnapshot, image: "")
                if categoryBD.title == "ROOT" {
                    self.root = categoryBD
                }
            }
            
            if self.root.version != DBViewModel.share.version {
                self.downloadPddBDCategory()
                self.downloadPddTestPollis()
                self.downloadTestStacktest()
            } else {
                DBViewModel.share.getAllTCategory()
            }
            
        }
        
    }
    
    func downloadPddBDCategory() {
        pddBDCategory.observe(.value) { snapshot in
            
            for categ in snapshot.children {
                var images = ""
                let params = (categ as AnyObject).childSnapshot(forPath: "params")
                if let data = params.value as? [String: Any] {
                        images = data["image"] as! String
                    }
                let categoryBD = ModelCategory(snapshot: categ as! DataSnapshot, image: images)
                if categoryBD.parentId != "0" && categoryBD.title !=
                    "Uncategorised" {
                    self.category.append(categoryBD)
//                    print("\(categoryBD.title)__\(categoryBD.parentId)")
                }
            }
        }
        
    }
    func downloadPddTestPollis() {
        pddBDPollis.observe(.value) { snapshot in
            for test in snapshot.children {
                var question = [""]
                var answer1 = [""]
                var answer2 = [""]
                var answer3 = [""]
                var answer4 = [""]
                var correct = [""]
                var img = [""]
                let params = (test as AnyObject).childSnapshot(forPath: "list_imgs")
                if let data = params.value as? [String: Any] {
                    question = data["question"] as! [String]
                    answer1 = data["answer1"] as! [String]
                    answer2 = data["answer2"] as! [String]
                    answer3 = data["answer3"] as! [String]
                    answer4 = data["answer4"] as! [String]
                    if let corrects = data["correct"] as? [String] {
                        correct = corrects
                    }
                    img = data["img"] as! [String]
                }
                
                let testPollis = ModelTest(snapshot: test as! DataSnapshot,
                                           question: question,
                                           answer1: answer1,
                                           answer2: answer2,
                                           answer3: answer3,
                                           answer4: answer4,
                                           correct: correct,
                                           img: img)
                self.testPollis.append(testPollis)
            }
        }
    }
    func downloadTestStacktest() {
        pddBDStacktest.observe(.value) { snapshot in
            for signs in snapshot.children {
                var img = [String]()
                var imgb = [String]()
                var vopros = [String]()
                var otwet = [String]()
                let params = (signs as AnyObject).childSnapshot(forPath: "list_imgs")
                for childer in params.children {
                    if let data = childer as? DataSnapshot {
                        if let dataSnaphot = data.value as? [String: Any] {
                            let arrayImg = dataSnaphot["img"] as! [String]
                            let arrayImgb = dataSnaphot["imgb"] as! [String]
                            if let arrayVopros = dataSnaphot["vopros"] as? [String] {
                                vopros.append(contentsOf: arrayVopros)
                            }
                            if let arrayOtwet = dataSnaphot["otwet"] as? [String] {
                                otwet.append(contentsOf: arrayOtwet)
                            }
                            img.append(contentsOf: arrayImg)
                            imgb.append(contentsOf: arrayImgb)
                        }
                        
                    }
                }
                self.stakTest.append(ModelStacktest(snaphot: signs as! DataSnapshot, img: img, imgb: imgb, vopros: vopros, otwet: otwet))
            }
            DBViewModel.share.saveCategory()
            DBViewModel.share.getAllTCategory()
        }
    }
    
   
}
