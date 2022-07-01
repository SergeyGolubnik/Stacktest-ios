//
//  StatistikView.swift
//  Stacktest-ios
//
//  Created by СОВА on 30.06.2022.
//

import SwiftUI

struct StatistikView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var titleBar: String
    @State var registerUser = false
    var body: some View {
        ZStack{
            VStack{
                Text("Для того чтобы статистика велась, необходимо зарегестрироваться")
                    .multilineTextAlignment(.center)
                    .font(.title)
                Button {
                    registerUser = true
                } label: {
                    Text("Зарегистрироватся")
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background(Color.blueApp)
                        .cornerRadius(6)
                        .shadow(radius: 4)
                }

            }.padding()
        }
        .onAppear {
            titleBar = "Статистика"
        }
    }
}

struct StatistikView_Previews: PreviewProvider {
    static var previews: some View {
        StatistikView(titleBar: .constant("Статистика"))
    }
}
