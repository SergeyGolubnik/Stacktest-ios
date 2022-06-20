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
    init(modelCategoryCore: ModelCategoryCore){
        self.id = modelCategoryCore.id ?? ""
        self.name = modelCategoryCore.name ?? ""
        self.alias = modelCategoryCore.alias ?? ""
        self.image = modelCategoryCore.image ?? ""
        self.parentId = modelCategoryCore.parentId ?? ""
        self.title = modelCategoryCore.title ?? ""
    }
}

