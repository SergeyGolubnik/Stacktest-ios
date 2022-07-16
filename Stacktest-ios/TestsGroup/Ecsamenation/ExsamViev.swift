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
    @State var rotationBool = false
    var body: some View {
        
        VStack(spacing: 5){
            HStack {
                Text(deleteString(str:modelEcsam.category?.title ?? ""))
                Spacer()
                Text(modelEcsam.title)
                Spacer()
                Text("\(modelEcsam.testExsameDable.count - modelEcsam.testExsame.count)/20")
            }.padding([.top,.horizontal])
            ScrollViewReader { scrollView in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack{
                        ForEach(modelEcsam.testExsameDable) { test in
                            ZStack{
                                let index = modelEcsam.getIndex(testEx: test, testArray: modelEcsam.testExsameDable) + 1
                                Rectangle()
                                    .foregroundColor(test.otvet == nil ? .white : test.otvet! ? .green : .red)
                                    .frame(width: 30, height: 30)
                                    .overlay(RoundedRectangle(cornerRadius: 5)
                                        .stroke(
                                            (modelEcsam.testExsameDable.count - modelEcsam.testExsame.count + 1) == (modelEcsam.getIndex(testEx: test, testArray: modelEcsam.testExsameDable) + 1) ?
                                            Color.green : Color.black, lineWidth: 3))
                                Text("\(index)")
                            }.id(test)
                        }
                        .onChange(of: modelEcsam.testExsame) { newValue in
                                let count = modelEcsam.testExsameDable.count - modelEcsam.testExsame.endIndex
                                    withAnimation {
                                        scrollView.scrollTo(modelEcsam.testExsameDable[count], anchor: .center)
                                    }
                            
                        }
                    }.padding(.horizontal)
                        .padding(.vertical, 5)
                }
            }
            Divider()
            HStack {
                Button {
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
                ForEach(modelEcsam.testExsame.reversed()) { test in
                    TinderQustionTest(bindingCart: $bindingCard, qustion: test).environmentObject(modelEcsam)
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            HStack{
                if modelEcsam.optionView == 2 {
                    Button {
                        modelEcsam.removeTest()
                    } label: {
                        ZStack{
                            Rectangle()
                                .foregroundColor(.blue)
                                .cornerRadius(5)
                                .shadow(radius: 4)
                                .frame(width: 80, height: 30).padding()
                            Image("znaju_papka")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 15)
                                .clipped()
                                .rotationEffect(Angle(degrees: 180.0))
                        }
                    }
                    Button {
                        rotationBool.toggle()
                    } label: {
                      
                        Image("flip")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 60, height: 60)
                            .clipped()
                    }

                }
                if bindingCard || modelEcsam.optionView == 2 {
                    Button {
                        doSwipe(rightSwipe: true)
                        bindingCard = false
                    } label: {
                        ZStack{
                            Rectangle()
                                .foregroundColor(.blue)
                                .cornerRadius(5)
                                .shadow(radius: 4)
                                .frame(width: 80, height: 30).padding()
                            Image("znaju_papka")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 15)
                                .clipped()
                        }
                    }
                } else {
                    ZStack{
                        Rectangle()
                            .foregroundColor(.gray.opacity(0.7))
                            .cornerRadius(5)
                            .shadow(radius: 4)
                            .frame(width: 80, height: 30).padding()
                        Image("znaju_papka")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 60, height: 15)
                            .clipped()
                    }
                }
            }
            Spacer()
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
        let cat = ExsamViewModel(category: StaticArray.shared.arrayStaticGroup11[1].modelCategory[0], optonView: 2)
        ExsamViev(modelEcsam: cat)
    }
}
