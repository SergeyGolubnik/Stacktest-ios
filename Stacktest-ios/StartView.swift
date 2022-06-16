//
//  StartView.swift
//  Stacktest-ios
//
//  Created by СОВА on 14.06.2022.
//

import SwiftUI

struct StartView: View {
    @State var russBol = false
    @State var ukrBool = false
    @State var estBool = false
    
    var body: some View {
        VStack {
            HStack{
                VStack(spacing: 5){
                    Button {
                        russBol.toggle()
                        UserDefaults.standard.set("ru", forKey: "Location")
                    } label: {
                        Image("russia1")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipped()
                    }
                    Text("РОССИЯ")
                        
                    Capsule()
                        .frame(width: 100, height: 2)
                }
                .padding()
                VStack(spacing: 5){
                    Button {
                        ukrBool.toggle()
                        UserDefaults.standard.set("uk", forKey: "Location")
                    } label: {
                        Image("ukraine")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipped()
                    }
                    Text("УКРАИНА")
                    Capsule()
                        .frame(width: 100, height: 2)
                }
                .padding()
            }
            VStack(spacing: 5){
                Button {
                    estBool.toggle()
                    UserDefaults.standard.set("en", forKey: "Location")
                } label: {
                    Image("estonia")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                }
                Text("ЭСТОНИЯ")
                Capsule()
                    .frame(width: 100, height: 2)
            }
            .padding()

        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
