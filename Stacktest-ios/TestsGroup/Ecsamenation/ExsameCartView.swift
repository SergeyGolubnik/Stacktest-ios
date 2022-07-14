//
//  ExsameCartView.swift
//  Stacktest-ios
//
//  Created by СОВА on 08.07.2022.
//

import SwiftUI
import SDWebImageSwiftUI


struct ExsameCartView: View {
    @EnvironmentObject var modelTestView: ExsamViewModel
    @State var qustion: ModelQuestion
    @State var ansver = ""
    @Binding var buttonBloc: Bool
    let ride = UIScreen.main.bounds
    var body: some View {
        ZStack(alignment: .center){
            Color.grinApp
            VStack(spacing: 0) {
                if qustion.img != ""{
                    WebImage(url: URL(string: "https://stacktest.ru/\(qustion.img)"))
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: ride.width / 1.3, maxHeight: ride.width / 2.5)
                        .clipped()
                        .padding([.top, .horizontal])
                } else {
                    Spacer()
                }
                Text(qustion.question)
                    .font(.system(size: 16))
                    .frame(maxWidth: ride.width / 1.3, maxHeight: ride.height / 8)
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.1)
                    .padding(.top)
                Spacer()
                VStack {
                    
                    if !buttonBloc {
                        Button {
                            ansver = "1"
                            answerOut()
                            buttonBloc = true
                        } label: {
                            testView(text: "1. \(qustion.answer1)", inter: nil)
                        }
                    } else {
                        testView(text: "1. \(qustion.answer1)", inter: "1")
                    }
                    if !buttonBloc {
                        Button {
                            ansver = "2"
                            answerOut()
                            buttonBloc = true
                        } label: {
                            testView(text: "2. \(qustion.answer2)", inter: nil)
                        }
                    } else {
                        testView(text: "2. \(qustion.answer2)", inter: "2")
                    }
                    if qustion.answer3 != "" {
                        if !buttonBloc {
                            Button {
                                ansver = "3"
                                answerOut()
                                buttonBloc = true
                            } label: {
                                testView(text: "3. \(qustion.answer3)", inter: nil)
                            }
                        } else {
                            testView(text: "3. \(qustion.answer3)", inter: "3")
                        }
                    }
                    if qustion.answer4 != "" {
                        if !buttonBloc {
                            Button {
                                ansver = "4"
                                answerOut()
                                buttonBloc = true
                            } label: {
                                testView(text: "4. \(qustion.answer4)", inter: nil)
                            }
                        } else {
                            testView(text: "4. \(qustion.answer4)", inter: "4")
                        }
                    }
                }
                Spacer()
            }
            .padding(.bottom)
        }
//        .frame(maxWidth: ride.width / 1.25, maxHeight: ride.height / 1.7)
        .cornerRadius(10)
        .overlay(RoundedRectangle(cornerRadius: 10)
            .stroke(Color.black, lineWidth: 0.1))
    }
    @ViewBuilder
    func testView(text: String, inter: String?) -> some View {
        Text(text)
            .font(.system(size: 16))
            .foregroundColor(.black)
            .frame(maxWidth: ride.width / 1.2, minHeight: ride.height / 22, alignment: .leading)
            .padding(.leading)
            .background(inter == nil ? .white : qustion.correct == inter ? Color.green : (ansver == inter ? Color.red : Color.white))
            .cornerRadius(5)
            .minimumScaleFactor(0.2)
            .multilineTextAlignment(.leading)
    }
    func answerOut() {
        let index = modelTestView.testExsameDable.firstIndex(where: { test in
            return qustion.id == test.id
        }) ?? 0
        if ansver == qustion.correct {
            modelTestView.testExsameDable[index].otvet = true
            print(modelTestView.testExsameDable[index])
        } else {
            modelTestView.testExsameDable[index].otvet = false
            print(modelTestView.testExsameDable[index])
        }
    }
}

struct ExsameCartView_Previews: PreviewProvider {
    static var previews: some View {
        ExsameCartView(qustion: StaticArray.shared.questionStatic, buttonBloc: .constant(false))
    }
}
