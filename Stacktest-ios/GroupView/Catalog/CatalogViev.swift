//
//  CatalogViev.swift
//  Stacktest-ios
//
//  Created by СОВА on 23.06.2022.
//

import SwiftUI

struct CatalogViev: View {
    @State var arrayPdd = DBViewModel.share.pddRossii
    var body: some View {
        
        ScrollView {
            ForEach(arrayPdd, id: \.id) { category in
                    Text(category.title)
                }
            
        }
    }
}

struct CatalogViev_Previews: PreviewProvider {
    static var previews: some View {
        CatalogViev()
    }
}
