//
//  ExsameCartView.swift
//  Stacktest-ios
//
//  Created by СОВА on 08.07.2022.
//

import SwiftUI
import SDWebImageSwiftUI
struct ExsameCartView: View {
    @State var qustion: ModelQuestion
    @State var ansver = ""
    @State var buttonBloc = false
    let ride = UIScreen.main.bounds
    var body: some View {
        ZStack(alignment: .center){
            Rectangle().foregroundColor(.grinApp).cornerRadius(10).shadow(radius: 5)
            VStack(spacing: 0) {
                if qustion.img != ""{
                    WebImage(url: URL(string: "https://stacktest.ru/\(qustion.img)"))
                        .resizable()
                        .scaledToFill()
                        .frame(width: ride.width / 1.3, height: ride.width / 2.5)
                        .clipped()
                        .padding([.top, .horizontal])
                } else {
                    Spacer()
                }
                Text(qustion.question)
                    .font(.system(size: 16))
                    .frame(width: ride.width / 1.3, height: ride.height / 8)
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.1)
                    .padding(.top)
                Spacer()
                VStack {
                    
                    if !buttonBloc {
                        Button {
                            ansver = "1"
                            buttonBloc = true
                        } label: {
                            Text("1. \(qustion.answer1)")
                                .font(.system(size: 16))
                                .foregroundColor(.black)
                                .frame(width: ride.width - 120, height: ride.height / 22, alignment: .leading)
                                .padding(.leading)
                                .background(Color.white).cornerRadius(5)
                                .minimumScaleFactor(0.2)
                                .multilineTextAlignment(.leading)
                        }
                    } else {
                        Text("1. \(qustion.answer1)")
                            .font(.system(size: 16))
                            .foregroundColor(.black)
                            .frame(width: ride.width - 120, height: ride.height / 22, alignment: .leading)
                            .padding(.leading)
                            .background(qustion.correct == "1" ? Color.green : (ansver == "1" ? Color.red : Color.white))
                            .cornerRadius(5)
                            .minimumScaleFactor(0.2)
                            .multilineTextAlignment(.leading)
                    }
                    if !buttonBloc {
                        Button {
                            ansver = "2"
                            buttonBloc = true
                        } label: {
                            Text("2. \(qustion.answer2)")
                                .font(.system(size: 16))
                                .foregroundColor(.black)
                                .frame(width: ride.width - 120, height: ride.height / 22, alignment: .leading)
                                .padding(.leading)
                                .background(Color.white).cornerRadius(5)
                                .minimumScaleFactor(0.2)
                                .multilineTextAlignment(.leading)
                        }
                    } else {
                        Text("2. \(qustion.answer2)")
                            .font(.system(size: 16))
                            .foregroundColor(.black)
                            .frame(width: ride.width - 120, height: ride.height / 22, alignment: .leading)
                            .padding(.leading)
                            .background(qustion.correct == "2" ? Color.green : (ansver == "2" ? Color.red : Color.white))
                            .cornerRadius(5)
                            .minimumScaleFactor(0.2)
                            .multilineTextAlignment(.leading)
                    }
                    if !buttonBloc {
                        Button {
                            ansver = "3"
                            buttonBloc = true
                        } label: {
                            Text("3. \(qustion.answer3)")
                                .font(.system(size: 16))
                                .foregroundColor(.black)
                                .frame(width: ride.width - 120, height: ride.height / 22, alignment: .leading)
                                .padding(.leading)
                                .background(Color.white).cornerRadius(5)
                                .minimumScaleFactor(0.2)
                                .multilineTextAlignment(.leading)
                        }
                    } else {
                        Text("3. \(qustion.answer3)")
                            .font(.system(size: 16))
                            .foregroundColor(.black)
                            .frame(width: ride.width - 120, height: ride.height / 22, alignment: .leading)
                            .padding(.leading)
                            .background(qustion.correct == "3" ? Color.green : (ansver == "3" ? Color.red : Color.white))
                            .cornerRadius(5)
                            .minimumScaleFactor(0.2)
                            .multilineTextAlignment(.leading)
                    }
                    if qustion.answer4 != "" {
                        if !buttonBloc {
                            Button {
                                ansver = "4"
                                buttonBloc = true
                            } label: {
                                Text("4. \(qustion.answer4)")
                                    .font(.system(size: 16))
                                    .foregroundColor(.black)
                                    .frame(width: ride.width - 120, height: ride.height / 22, alignment: .leading)
                                    .padding(.leading)
                                    .background(Color.white).cornerRadius(5)
                                    .minimumScaleFactor(0.2)
                                    .multilineTextAlignment(.leading)
                            }
                        } else {
                            Text("4. \(qustion.answer4)")
                                .font(.system(size: 16))
                                .foregroundColor(.black)
                                .frame(width: ride.width - 120, height: ride.height / 22, alignment: .leading)
                                .padding(.leading)
                                .background(qustion.correct == "1" ? Color.green : (ansver == "1" ? Color.red : Color.white))
                                .cornerRadius(5)
                                .minimumScaleFactor(0.2)
                                .multilineTextAlignment(.leading)
                        }
                    }
                }
                Spacer()
            }
            .padding(.bottom)
        }
        .frame(width: ride.width / 1.25, height: ride.height / 1.7)
    }
}

struct ExsameCartView_Previews: PreviewProvider {
    static var previews: some View {
        ExsameCartView(qustion: questionStatic)
    }
}