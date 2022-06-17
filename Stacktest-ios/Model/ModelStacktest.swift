//
//  ModelStacktest.swift
//  Stacktest-ios
//
//  Created by СОВА on 16.06.2022.
//

import Foundation
import Firebase

struct ModelStacktest {
    var id: String
    var name: String
    var title: String
    var category: String
    var imageLink: String
    var imgRek: String
    var img: [String]
    var imgb: [String]
    var vopros: [String]?
    var otwet: [String]?
    
    init(snaphot: DataSnapshot, img: [String], imgb: [String], vopros: [String]?, otwet: [String]?){
        let snapshotVatio = snaphot.value as! [String: Any]
        id = snapshotVatio["id"] as! String
        name = snapshotVatio["alias"] as! String
        title = snapshotVatio["title"] as! String
        category = snapshotVatio["catid"] as! String
        imageLink = snapshotVatio["image_link"] as! String
        imgRek = snapshotVatio["img_rek"] as! String
        
        self.img = img
        self.imgb = imgb
        self.vopros = vopros
        self.otwet = otwet
    }
}
