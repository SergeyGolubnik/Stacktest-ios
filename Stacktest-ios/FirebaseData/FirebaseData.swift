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
    var category = [ModelCategory]()
    let pddBDCategory = Database.database().reference(withPath: "PDD-BD").child("test-category").child("t8rv0_category")
    let pddMewBD = Database.database().reference(withPath: "NewBasePDD").child("root")
    
    func downloadPddBDCategory() {
        pddBDCategory.observe(.value) { snapshot in
            
            for categ in snapshot.children {
                var images = ""
                let params = (categ as AnyObject).childSnapshot(forPath: "params")
                if let data = params.value as? [String: Any] {
                        images = data["image"] as! String
                    }
//                print(images)
                let categoryBD = ModelCategory(snapshot: categ as! DataSnapshot, image: images)
                self.category.append(categoryBD)
            }
            print(self.category)
        }
    }
    func updateCategory(array: [ModelCategory]) {
        
        let arraySorted = array.filter {$0.parentId != "1"}
        for parentCategory in arraySorted {
            for chald in category {
                if parentCategory.id == chald.parentId {
                    pddMewBD.child(parentCategory.name).child(chald.name).updateChildValues([
                        "id": chald.id,
                        "name": chald.name,
                        "alias": chald.alias,
                        "image": chald.image,
                        "parentId": chald.parentId,
                        "title": chald.title
                    ])
                }
            }
        }
    }
}
