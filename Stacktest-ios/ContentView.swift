//
//  ContentView.swift
//  Stacktest-ios
//
//  Created by СОВА on 14.06.2022.
//

import SwiftUI

struct ContentView: View {
    @State var location = UserDefaults.standard.string(forKey: "Location")
    var body: some View {
            TableView()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
