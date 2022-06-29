//
//  LocationViewPopower.swift
//  Stacktest-ios
//
//  Created by СОВА on 29.06.2022.
//

import SwiftUI

struct LocationViewPopower: View {
    @EnvironmentObject var modelDb: DBViewModel
    @Binding var exitBool: Bool
    var body: some View {
        VStack(spacing: 20) {
            VStack(spacing: 5){
                Button {
                    UserDefaults.standard.set("ru", forKey: "Location")
                    modelDb.locale = "ru"
                    modelDb.pddCategoryPry()
                    exitBool.toggle()
                } label: {
                    Image("russia1")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .clipped()
                }
                Text("РОССИЯ")
                    .font(.system(size: 10))
                
                Capsule()
                    .frame(width: 50, height: 1)
            }
            VStack(spacing: 5){
                Button {
                    UserDefaults.standard.set("uk", forKey: "Location")
                    modelDb.locale = "uk"
                    modelDb.pddCategoryPry()
                    exitBool.toggle()
                } label: {
                    Image("ukraine")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .clipped()
                }
                Text("УКРАИНА")
                    .font(.system(size: 10))
                Capsule()
                    .frame(width: 50, height: 1)
            }
            
            VStack(spacing: 5){
                Button {
                    UserDefaults.standard.set("en", forKey: "Location")
                    modelDb.locale = "en"
                    modelDb.pddCategoryPry()
                    exitBool.toggle()
                } label: {
                    Image("estonia")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .clipped()
                }
                Text("ЭСТОНИЯ")
                    .font(.system(size: 10))
                Capsule()
                    .frame(width: 50, height: 1)
            }
            
        }
        
    }
}

struct LocationViewPopower_Previews: PreviewProvider {
    static var previews: some View {
        LocationViewPopower(exitBool: .constant(false))
    }
}
