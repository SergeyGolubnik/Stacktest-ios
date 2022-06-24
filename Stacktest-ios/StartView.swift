//
//  StartView.swift
//  Stacktest-ios
//
//  Created by СОВА on 14.06.2022.
//

import SwiftUI

struct StartView: View {
    @Binding var localeBool: Bool
    
    var body: some View {
        VStack {
            HStack{
                VStack(spacing: 5){
                    Button {
                        localeBool = true
                        UserDefaults.standard.set("ru", forKey: "Location")
                        UserDefaults.standard.set(localeBool, forKey: "LocationBool")
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
                        localeBool = true
                        UserDefaults.standard.set("uk", forKey: "Location")
                        UserDefaults.standard.set(localeBool, forKey: "LocationBool")
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
                    localeBool = true
                    UserDefaults.standard.set("en", forKey: "Location")
                    UserDefaults.standard.set(localeBool, forKey: "LocationBool")
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
        StartView(localeBool: .constant(false))
    }
}
