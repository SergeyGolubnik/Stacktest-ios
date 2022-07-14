//
//  EcsamViev.swift
//  Stacktest-ios
//
//  Created by СОВА on 07.07.2022.
//

import SwiftUI

struct ExsamViev: View {
    @ObservedObject var modelEcsam: ExsamViewModel
    @Environment(\.presentationMode) var presentation
    @State var bindingCard = false
    @State var name: String
    var body: some View {
        
        VStack(spacing: 4){
            HStack {
                Text(deleteString(str:modelEcsam.category?.title ?? ""))
                Spacer()
                Text(name)
                Spacer()
                Text("\(20 - modelEcsam.testExsame.count)/20")
            }.padding([.top,.horizontal])
            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    ForEach(modelEcsam.testExsameDable) { test in
                        ZStack{
                            Rectangle()
                                .foregroundColor(test.otvet == nil ? .white : test.otvet! ? .green : .red)
                                .frame(width: 30, height: 30)
                                .overlay(RoundedRectangle(cornerRadius: 2)
                                .stroke(
                                    (20 - modelEcsam.testExsame.count + 1) == (modelEcsam.getIndex(testEx: test, testArray: modelEcsam.testExsameDable) + 1) ?
                                    Color.green : Color.black, lineWidth: 2))
                            Text("\(modelEcsam.getIndex(testEx: test, testArray: modelEcsam.testExsameDable) + 1)")
                        }
                    }
                }.padding(.horizontal)
            }
            Divider()
            HStack {
                Button {
                    modelEcsam.testExsame.removeAll()
                    modelEcsam.testExsameDable.removeAll()
                    presentation.wrappedValue.dismiss()
                } label: {
                    Image("exit")
                }
                .padding()
                Spacer()
                Text("15:21")
                    .padding()
            }
        ZStack {
//            modelEcsam.testExsame
//            StaticArray.shared.exsameStatic
            ForEach(modelEcsam.testExsame.reversed()) { test in
                TinderQustionTest(bindingCart: $bindingCard, qustion: test).environmentObject(modelEcsam)
            }
        }
            .padding()
            .padding(.vertical)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
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
    func deleteString(str: String) -> String {
        guard let index = str.firstIndex(of: "'") else {return "Тесты"}
        var name = ""
        for next in str[index...] {
            name.append(next)
        }
        return name
    }
}

struct EcsamViev_Previews: PreviewProvider {
    static var previews: some View {
        let cat = ExsamViewModel(category: StaticArray.shared.arrayStaticGroup11[1].modelCategory[0])
        ExsamViev(modelEcsam: cat, name: "Экзамен")
    }
}
