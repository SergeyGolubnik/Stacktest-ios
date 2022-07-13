//
//  EcsamViev.swift
//  Stacktest-ios
//
//  Created by СОВА on 07.07.2022.
//

import SwiftUI

struct ExsamViev: View {
    @ObservedObject var modelEcsam: ExsamViewModel
    @State var bindingCard = false
    var body: some View {
        
        ZStack {
            ForEach(modelEcsam.testExsame.reversed()) { test in
                TinderQustionTest(bindingCart: $bindingCard, qustion: test).environmentObject(modelEcsam)
            }
        }
        .padding([.top,.bottom], 100)
            .padding()
            .padding(.vertical)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        VStack{
            if bindingCard {
                Button {
                    doSwipe(rightSwipe: true)
                    bindingCard = false
                } label: {
                    Text("Enter->")
                }
            } else {
                Text("Enter")
            }

        }
    }
    func doSwipe(rightSwipe: Bool = false){
        
        guard let first = modelEcsam.testExsame.first else{
            return
        }
        
        // Using Notification to post and receiving in Stack Cards...
        NotificationCenter.default.post(name: NSNotification.Name("ACTIONFROMBUTTON"), object: nil, userInfo: [
        
            "id": first.id,
            "rightSwipe": rightSwipe
        ])
    }
}

struct EcsamViev_Previews: PreviewProvider {
    static var previews: some View {
        let cat = ExsamViewModel(category: StaticArray.shared.arrayStaticGroup11[1].modelCategory[0])
        ExsamViev(modelEcsam: cat)
    }
}
