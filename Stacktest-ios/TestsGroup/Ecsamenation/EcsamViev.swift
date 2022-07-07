//
//  EcsamViev.swift
//  Stacktest-ios
//
//  Created by СОВА on 07.07.2022.
//

import SwiftUI

struct EcsamViev: View {
    @ObservedObject var modelEcsam: EcsamViewModel
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct EcsamViev_Previews: PreviewProvider {
    static var previews: some View {
        EcsamViev(modelEcsam: EcsamViewModel(category: arrayStaticGroup[1].modelCategory[0]))
    }
}
