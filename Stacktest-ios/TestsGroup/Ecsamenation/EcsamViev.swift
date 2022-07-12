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
        VStack{

            Text(modelEcsam.category?.test[0].question[0] ?? "")
        }
//        VStack {
//            ForEach(modelEcsam.testExsame, id: \.id) { test in
//                GeometryReader{proxy in
//                    let size = proxy.size
//
//                    let index = CGFloat(modelEcsam.getIndex(testEx: test))
//                    // Showing Next two cards at top like a Stack...
//                    let topOffset = (index <= 2 ? index : 2) * 15
//
//                    ZStack{
//
//                        ExsameCartView(qustion: test)
////                            .aspectRatio(contentMode: .fill)
//                        // Reducing width too...
//                            .frame(width: size.width - topOffset, height: size.height)
//                            .offset(y: -topOffset)
//                    }
//                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
//                }
//
//            }
//        }
    }
}

struct EcsamViev_Previews: PreviewProvider {
    static var previews: some View {
        let cat = EcsamViewModel(category: arrayStaticGroup[1].modelCategory[0])
        EcsamViev(modelEcsam: cat)
    }
}
