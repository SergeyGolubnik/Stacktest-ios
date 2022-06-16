//
//  ModelCategory.swift
//  Stacktest-ios
//
//  Created by СОВА on 15.06.2022.
//

import Foundation
import Firebase


struct ModelCategory {
    var id: String
    var name: String
    var alias: String
    var image = ""
    var parentId: String
    var title: String
    
    init(snapshot: DataSnapshot, image: String) {
        let snapshotValio = snapshot.value as! [String: Any]
        id = snapshotValio["id"] as! String
        name = snapshotValio["alias"] as! String
        alias = snapshotValio["alias"] as! String
        parentId = snapshotValio["parent_id"] as! String
        title = snapshotValio["title"] as! String
        
        self.image = image
    }
}
struct Params {
    var image: String?
    init(snapshot: DataSnapshot){
        guard let snapshotValio = snapshot.value as? [String: Any] else {return}
        image = snapshotValio["image"] as? String
    }
}
